import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';


class SubscriptionFormPage3 extends StatelessWidget {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(height: Layout.of(context).gridUnit(3)),
                    Column(
                      children: <Widget>[
                        Text('Comment t\'appelles-tu ?', style: Theme.of(context).textTheme.title),
                        Container(height: Layout.of(context).gridUnit(0.5)),
                        Text('Merci d\'entrer ton nom et prénom', textAlign: TextAlign.center,)
                      ],
                    ),
                    Container(height: Layout.of(context).gridUnit(7)),
                    NameForm(viewModel),
                    Expanded(child:Container()),
                    RaisedButton(
                      child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                      onPressed: viewModel.nextStep
                    ),
                    Container(height:Layout.of(context).gridUnit(1))
                  ],
                )
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
   
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  List<TextEditingController> _controllers = [];

  FocusNode _firstNameNode;
  FocusNode _lastNameNode;
  List<FocusNode> _focusNodes;


  // On load set controllers to value stored in redux and add onChange listeners
  @override
  void didChangeDependencies() {
    if (_controllers.isNotEmpty) {
      return;
    }

    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm;

    _firstNameController.text = subscriptionForm.firstName;
    _lastNameController.text = subscriptionForm.lastName;

    _controllers = [
      _firstNameController,
      _lastNameController,
    ];
     
    _controllers.forEach((dynamic controller) => controller.addListener(_onChanged));


    _firstNameNode = FocusNode();
    _lastNameNode = FocusNode();

    _focusNodes = [
      _firstNameNode,
      _lastNameNode
    ];

    super.didChangeDependencies();
  }


  // At each field change send value to redux store
  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((b) => b
      ..firstName = _firstNameController.text == '' ? null : _firstNameController.text.trim()
      ..lastName = _lastNameController.text == '' ? null : _lastNameController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _firstNameController,
            focusNode: _firstNameNode,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              labelText: 'Prénom'
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_lastNameNode);
              },
          ),
          Container(height: Layout.of(context).gridUnit(2)),
          TextFormField(
            controller: _lastNameController,
            focusNode: _lastNameNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom'
            ),
          )
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
