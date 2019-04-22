import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:built_collection/built_collection.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../data/models/postcode.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../../utils/colors.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';
import '../../presentation/base_card.dart';
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
  List<TextEditingController> _controllers = [];
  FocusNode _otherLocationNode;
  List<FocusNode> _focusNodes;


  int _selectedLocationIndex;
  List<String> _locationChoices = <String>[
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
        title: 'Conteneurs',
        subtitle: 'Tu peux utiliser tes propres conteneurs si tu en as déjà. Sinon, nous pouvons t\'en fournir.'
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
              child: TextField(
                onTap: () => _onTap(selectedItem: 5),
                controller: _otherLocationController,
                focusNode: _otherLocationNode,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                maxLines: null,
                style: Theme.of(context).textTheme.body1,
                decoration: InputDecoration(
                  hintText: 'Autre',
                  hintStyle: Theme.of(context).textTheme.body1,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: InputBorder.none,
                )
              )
        ),
        ),
      ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: null,
        // onPressed: _wantsContainers != null ? widget.viewModel.nextStep : null
      )
    );
  }


@override
  void didChangeDependencies() {
    if (_controllers.isNotEmpty) {
      return;
    }

    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm;

    _selectedLocationIndex = subscriptionForm.selectedLocationIndex;
    if (_selectedLocationIndex == 5) {
      _otherLocationController.text = subscriptionForm.location;
    }
    _controllers = [
      _otherLocationController,
    ];

    _controllers.forEach((dynamic controller) => controller.addListener(_onChanged));


    _otherLocationNode = FocusNode();
    _focusNodes = [
      _otherLocationNode,
    ];
        
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((dynamic controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    _focusNodes.forEach((dynamic node) {
      node.dispose();
    });

    super.dispose();
  }

  void _onChanged() {
    // At each field change send value to redux store
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((b) => b
      ..location = _otherLocationController.text == '' ? null : _otherLocationController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }
  }


  void _onTap({int selectedItem}) {
    if (selectedItem != _selectedLocationIndex) {
      setState(() {
        _selectedLocationIndex = selectedItem;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((b) => b
          ..selectedLocationIndex = selectedItem
          ..location = selectedItem != 5 ? _locationChoices[selectedItem] : null
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