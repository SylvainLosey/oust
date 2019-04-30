import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';
import '../../presentation/selectable_item.dart';


class SubscriptionFormLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.previousStep();
            return false;
          },
          child: Scaffold(
            appBar: MainAppBar(onExit: viewModel.exit),

            // All this stuff is necessary to have SinglechildScrollView play nice with 
            // the spacer in the TitleFormButton widget - see SingleChildScrollView official doc
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: LocationForm(viewModel),
                    )
                  )
                );
              }
            )
          )
        );
      }
    );
  }
}


class LocationForm extends StatefulWidget {
  final _ViewModel viewModel;

  LocationForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => LocationFormState();
}

class LocationFormState extends State<LocationForm> {
  final TextEditingController _otherLocationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _otherLocationNode;

  int _selectedLocationIndex;
  final List<String> _locationChoices = <String>[
    'Devant la porte d\'entrée',
    'Dans le jardin ou sur la terasse',
    'Devant ou dans le garage',
    'Devant ou dans la cave',
    'Devant ou dans un local / cabanon',
  ];

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Emplacement',
        subtitle: 'Où se trouveront tes conteneurs lors de notre passage ?'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...List.generate(_locationChoices.length, (int index) {
            return SelectableItem(
              onTap: () => _onTap(selectedItem: index),
              text: _locationChoices[index],
              selected: _selectedLocationIndex == index,
            );
          },
        ),
        SelectableItem(
            selected: _selectedLocationIndex == 5,
            onTap: () => _onTap(selectedItem: 5),
            child: Flexible(
              child: Form(
                key: _formKey,
                // We use IgnorePointer to disable the interception of the tap by TextField
                // Therefore SelectableItem (GestureDetector) gets it (via _onTap), from which we request focus subsequently
                child: IgnorePointer(
                  child: TextFormField(
                    validator: (String value) {
                      return (_selectedLocationIndex == 5 && value.isEmpty) ? 'Veuillez préciser où se trouvent vos conteurs' : null;
                    },
                    controller: _otherLocationController,
                    focusNode: _otherLocationNode,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    style: Theme.of(context).textTheme.body1,
                    decoration: InputDecoration(
                      labelText: 'Autre',
                      labelStyle: Theme.of(context).textTheme.body1,
                      hintText: 'Préciser ...',
                      hintStyle: Theme.of(context).textTheme.body1,
                      contentPadding: EdgeInsets.symmetric(vertical: -10),
                      border: InputBorder.none,
                    )
                  )
                )
              )
            ),
          ),
        ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.subscriptionForm.selectedLocationIndex == null 
          ? null
          : () { if (_formKey.currentState.validate()) widget.viewModel.nextStep;}
      )
    );
  }


@override
  void didChangeDependencies() {
    _otherLocationController.removeListener(_onChanged);
    _selectedLocationIndex = widget.viewModel.subscriptionForm.selectedLocationIndex;
    if (_selectedLocationIndex == 5) {
      _otherLocationController.text = widget.viewModel.subscriptionForm.location;
    }
    _otherLocationController.addListener(_onChanged);

    _otherLocationNode = FocusNode();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _otherLocationController.removeListener(_onChanged);
    _otherLocationController.dispose();
    _otherLocationNode.dispose();

    super.dispose();
  }

  void _onChanged() {
    // When we tap on 5 (other) onTap is called, then onChanged too - with the same copy of the viewModel
    // Therefore we get a new copy from the store each time
    final SubscriptionForm subscriptionForm = StoreProvider.of<AppState>(context).state.subscriptionFormState.subscriptionForm;
    final SubscriptionForm newSubscriptionForm = subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..location = _otherLocationController.text == '' ? null : _otherLocationController.text.trim());
    if (subscriptionForm != newSubscriptionForm && subscriptionForm.selectedLocationIndex == 5) {
      widget.viewModel.onChanged(newSubscriptionForm);
    }
  }

  void _onTap({int selectedItem}) {
    if (selectedItem != _selectedLocationIndex) {
      setState(() {
        _selectedLocationIndex = selectedItem;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
          ..selectedLocationIndex = selectedItem
          ..location = selectedItem != 5 ? _locationChoices[selectedItem] : _otherLocationController.text.trim()
        ));
      });
    }

    // Set and dismiss focus when clicking / leaving other
    if (selectedItem == 5) {
      FocusScope.of(context).requestFocus(_otherLocationNode);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}