import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../data/models/subscription_form.dart';
import '../../../redux/app/app_state.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';

// Notes on the stucture of form pages
// It is best to keep the form and button in the same Stateful widget to avoid having to pass State up/down
// There needs to be a Stateful widget below storeprovider in the hierarchy, placing it above would leave it without acces to the viewmodel
// Don't try to refactor this unless you are sure - Columns and Spaced/Flex widget when nested don't go well together
class SubscriptionFormName extends StatelessWidget {
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
            body: NameForm(viewModel),
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
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
   
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  List<TextEditingController> _controllers = [];

  FocusNode _firstNameNode;
  FocusNode _lastNameNode;
  List<FocusNode> _focusNodes;

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Comment t\'appelles-tu ?',
        subtitle: 'Merci d\'entrer ton nom et prénom',
      ),
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _firstNameController,
              focusNode: _firstNameNode,
              decoration: InputDecoration(labelText: 'Prénom'),
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_){
                FocusScope.of(context).requestFocus(_lastNameNode);
              },
            ),
            Container(height: Layout.of(context).gridUnit(2)),
            TextFormField(
              controller: _lastNameController,
              focusNode: _lastNameNode,
              decoration: InputDecoration(labelText: 'Nom'),
              textInputAction: TextInputAction.done,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              onFieldSubmitted: (_) => widget.viewModel.nextStep(),
            ),
          ],
        ),
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _isButtonEnabled ? widget.viewModel.nextStep : null
      ),
    );
  }

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
      ..firstName = _firstNameController.text == '' ? null : _firstNameController.text.trim()
      ..lastName = _lastNameController.text == '' ? null : _lastNameController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }

    // Disable/enable button if conditions are met
    if (_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty) {
      if (_isButtonEnabled != true) setState(() {_isButtonEnabled = true;});
    } else {
      if (_isButtonEnabled != false) setState(() {_isButtonEnabled = false;}); 
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
