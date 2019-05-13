import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/postcode.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';


class SubscriptionFormAddress extends StatelessWidget {
  static int step = 5;

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
            body: AddressForm(viewModel),
          )
        );
      },
    );
  }
}


class AddressForm extends StatefulWidget {
  final _ViewModel viewModel;

  AddressForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  List<TextEditingController> _controllers = <TextEditingController>[];

  final FocusNode _addressNode = FocusNode();
  final FocusNode _postcodeNode = FocusNode();
  List<FocusNode> _focusNodes;

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Où habites-tu ?',
        subtitle: 'Complète les champs ci-dessous'
      ),
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
            controller: _addressController,
            focusNode: _addressNode,
            decoration: InputDecoration(
              labelText: 'Adresse',
              hintText: 'Rue et numéro',
            ),
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(80)],
            textCapitalization: TextCapitalization.sentences,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_postcodeNode);
            },
          ),
          Container(height: Layout.of(context).gridUnit(2)),
          TypeAheadFormField(
            suggestionsBoxVerticalOffset: 24,
            textFieldConfiguration: TextFieldConfiguration(
              controller: _postcodeController,
              focusNode: _postcodeNode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Code postal et localité',
                suffixIcon: _postcodeController.text.isEmpty ? null : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((b) => b..postcode = null));
                    _postcodeController.text = '';
                  }
                )
              )
            ),
            suggestionsCallback: _suggestionCallback,
            onSuggestionSelected: _onSuggestionSelected,
            itemBuilder: _itemBuilder,
            noItemsFoundBuilder: _noItemsFoundBuilder,
          ),
          ],
        )
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _addressController.text.isNotEmpty && widget.viewModel.selectedPostcode != null 
        ? () {if (_formKey.currentState.validate()) widget.viewModel.nextStep(widget.viewModel.postcodes[widget.viewModel.selectedPostcode]);}
        : null
      ),
    );
  }

  List<Postcode> _suggestionCallback(String pattern) {
    return Postcode.getSuggestions(pattern, widget.viewModel.postcodes.toMap());
  }

  void _onSuggestionSelected(Postcode postcode) {
     widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((b) => b..postcode = postcode.id));
    _postcodeController.text = '${postcode.postcode} ${postcode.name}';
  }

  ListTile _itemBuilder(BuildContext context, Postcode postcode) {
    return ListTile(title: Text('${postcode.postcode} ${postcode.name}'));
  }

  Widget _noItemsFoundBuilder(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16), child:Text('Aucun code postal ou localité trouvé'));
  }


  @override
  void didChangeDependencies() {
    _controllers = <TextEditingController>[
      _addressController,
      _postcodeController,
    ];

    _focusNodes = <FocusNode>[
      _addressNode,
      _postcodeNode
    ];

    _controllers.forEach((TextEditingController controller) => controller.removeListener(_onChanged));

    _addressController.text = widget.viewModel.subscriptionForm.address;
    _postcodeController.text = widget.viewModel.selectedPostcode != null ? '${widget.viewModel.postcodes[widget.viewModel.selectedPostcode].postcode} ${widget.viewModel.postcodes[widget.viewModel.selectedPostcode].name}' : '';
    
    _controllers.forEach((TextEditingController controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((dynamic controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    _focusNodes.forEach((FocusNode node) => node.dispose());

    super.dispose();
  }

  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..address = _addressController.text == '' ? null : _addressController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }
  }
}

@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final int selectedPostcode;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final BuiltMap<int, Postcode> postcodes;


  _ViewModel({
    this.subscriptionForm,
    this.selectedPostcode,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged,
    this.postcodes
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      selectedPostcode: store.state.subscriptionFormState.subscriptionForm.postcode,
      nextStep: (Postcode selectedPostcode) {
        if (selectedPostcode.subscriptionAvailable) {
          store.dispatch(SubscriptionFormNextStep());
        } else {
          store.dispatch(SubscriptionFormNextStep(subscriptionIsUnavailable: true));
        }
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      postcodes: store.state.dataState.postcodes,
     );
  }
}
