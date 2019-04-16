import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;


import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';


class SubscriptionFormPage4 extends StatelessWidget {
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
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close, size: 30,),
                  onPressed: viewModel.exit
                )
              ],
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: backgroundColor,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
                child: NameForm(viewModel),
              )
            )
          )
        );
      },
    );
  }
}


class NameForm extends StatefulWidget {
  final _ViewModel viewModel;

  NameForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => NameFormState();
}

class NameFormState extends State<NameForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
   
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  List<TextEditingController> _controllers = [];

  FocusNode _addressNode;
  FocusNode _postcodeNode;
  List<FocusNode> _focusNodes;


  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  void didChangeDependencies() {
    if (_controllers.isNotEmpty) {
      return;
    }

    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm;

    _addressController.text = subscriptionForm.address;
    // _postcodeController.text = subscriptionForm.postcodeId;

    _controllers = [
      _addressController,
      _postcodeController,
    ];
     
    _controllers.forEach((dynamic controller) => controller.addListener(_onChanged));


    _addressNode = FocusNode();
    _postcodeNode = FocusNode();

    _focusNodes = [
      _addressNode,
      _postcodeNode
    ];

    super.didChangeDependencies();
  }


  void _onChanged() {
    // At each field change send value to redux store
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((b) => b
      ..address = _addressController.text == '' ? null : _addressController.text.trim()
      // ..postcode = _postcodeController.text == '' ? null : _postcodeController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }

    // Disable/enable button if conditions are met
    if (_addressController.text.isNotEmpty && _postcodeController.text.isNotEmpty) {
      if (_isButtonEnabled != true) setState(() {_isButtonEnabled = true;});
    } else {
      if (_isButtonEnabled != false) setState(() {_isButtonEnabled = false;}); 
    }
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


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(height: Layout.of(context).gridUnit(3)),
          Column(
            children: <Widget>[
              Text('Où habites-tu ?', style: Theme.of(context).textTheme.title),
              Container(height: Layout.of(context).gridUnit(0.5)),
              Text('Complète les champs ci-dessous', textAlign: TextAlign.center)
            ],
          ),
          Container(height: Layout.of(context).gridUnit(7)),
          TextFormField(
            controller: _addressController,
            focusNode: _addressNode,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Adresse',
              hintText: 'Rue et numéro',
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_postcodeNode);
              },
          ),
          Container(height: Layout.of(context).gridUnit(2)),
          TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _postcodeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                labelText: 'Code postal'
              )
            ),
            suggestionsCallback: (pattern) {},
            onSuggestionSelected: (suggestion) {},
            itemBuilder: (context, suggestion) => Container(),
          ),
          Expanded(child:Container()),
          RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: _isButtonEnabled ? widget.viewModel.nextStep : null
          ),
          Container(height:Layout.of(context).gridUnit(1))
        ],
      )
    );
  }
}



@immutable
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