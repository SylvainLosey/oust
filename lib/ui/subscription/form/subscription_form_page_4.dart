import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:redux/redux.dart';

import '../../../data/models/postcode.dart';
import '../../../data/models/subscription_form.dart';
import '../../../redux/app/app_state.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';


class SubscriptionFormAddress extends StatelessWidget {
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
  bool _isButtonEnabled = false;
  Postcode _selectedPostcode;
   
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  List<TextEditingController> _controllers = <TextEditingController>[];

  FocusNode _addressNode;
  FocusNode _postcodeNode;
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
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_postcodeNode);
            },
          ),
          Container(height: Layout.of(context).gridUnit(2)),
          TypeAheadFormField(
            suggestionsBoxVerticalOffset: 24,
            textFieldConfiguration: TextFieldConfiguration(
              controller: _postcodeController,
              decoration: InputDecoration(
                labelText: 'Code postal et localité',
                hintText: 'Ex:  1470 Estavayer-le-Lac',
                suffixIcon: _postcodeController.text.isEmpty ? null : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _selectedPostcode = null;
                      _postcodeController.clear();
                    });
                  },
                )
              )
            ),
            validator: _validator,
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
        onPressed: _isButtonEnabled 
        ? () {if (_formKey.currentState.validate()) widget.viewModel.nextStep(_selectedPostcode);}
        : null
      ),
    );
  }

  // Typeahead field helpers
  String _validator(String value) {
    if (_selectedPostcode == null) {
      return 'Choisissez une valeur dans la liste déroulante';
    } else {
      return null;
    }
  }

  List<Postcode> _suggestionCallback(String pattern) {
    return Postcode.getSuggestions(pattern, widget.viewModel.postcodes.toMap());
  }

  void _onSuggestionSelected(Postcode postcode) {
    _selectedPostcode = postcode;
    _postcodeController.text = '${_selectedPostcode.postcode} ${_selectedPostcode.name}';
    _formKey.currentState.validate();
  }

  ListTile _itemBuilder(BuildContext context, Postcode postcode) {
    return ListTile(title: Text('${postcode.postcode} ${postcode.name}'));
  }

  Widget _noItemsFoundBuilder(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16), child:Text('Aucun code postal ou localité trouvé'));
  }


  // Redux 
  @override
  void didChangeDependencies() {
    if (_controllers.isNotEmpty) {
      return;
    }

    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm;
    _addressController.text = subscriptionForm.address;

    if (subscriptionForm.postcode != null) {
      final Postcode postcode = widget.viewModel.postcodes[subscriptionForm.postcode];
      _selectedPostcode = widget.viewModel.postcodes[subscriptionForm.postcode];
      _postcodeController.text = '${postcode.postcode} ${postcode.name}';
    }

    _controllers = <TextEditingController>[
      _addressController,
      _postcodeController,
    ];
    _controllers.forEach((dynamic controller) => controller.addListener(_onChanged));

    _addressNode = FocusNode();
    _postcodeNode = FocusNode();
    _focusNodes = <FocusNode>[
      _addressNode,
      _postcodeNode
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
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..address = _addressController.text == '' ? null : _addressController.text.trim()
      ..postcode = _postcodeController.text == '' ? null : _selectedPostcode?.id
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }

    // Disable/enable button if conditions are met
    if (_addressController.text.isNotEmpty && _postcodeController.text.length > 4) {
      if (_isButtonEnabled != true) setState(() {_isButtonEnabled = true;});
    } else {
      if (_isButtonEnabled != false) setState(() {_isButtonEnabled = false;}); 
    }

    // This handles the case where the user selects a postcode, but then modifies the field manually
    // 1. If the selected postcode doesn't match the first result of getSuggestion from text value, delete selected postcode
    // 2. If there is no match at all with current text value, delete selected postcode (catch statement)
    if (_selectedPostcode != null) {
      try {
        final Postcode closestMatch = Postcode.getSuggestions(_postcodeController.text, widget.viewModel.postcodes.toMap())[0];
        if (_selectedPostcode != null && closestMatch != null){
          if (_selectedPostcode.id != closestMatch.id) {
            _selectedPostcode = null;
          }
        }
      } catch(e) {
        _selectedPostcode = null;
      }
    }
  }
}

@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final BuiltMap<int, Postcode> postcodes;


  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged,
    this.postcodes
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
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
