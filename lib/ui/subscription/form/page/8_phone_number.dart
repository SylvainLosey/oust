import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/validators.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';


class SubscriptionFormPhone extends StatelessWidget {
  static int step = 10;

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
            body: PhoneForm(viewModel),
          )
        );
      },
    );
  }
}


class PhoneForm extends StatefulWidget {
  final _ViewModel viewModel;

  PhoneForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => PhoneFormState();
}

class PhoneFormState extends State<PhoneForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Téléphone',
        subtitle: 'Si malgré ces infos nous ne parvenons pas à trouver tes conteneurs au premier passage, nous te contacterons à ce numéro.'
      ),
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _phoneController,
              // validator: phoneValidator,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Téléphone',
                hintText: '079 987 65 43',
              ),
            ),
          ]
        )
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _phoneController.text.length < 3 
          ? null
          : () { if (_formKey.currentState.validate()) widget.viewModel.nextStep(); }
      ),
    );
  }


  @override
  void didChangeDependencies() {
    _phoneController.removeListener(_onChanged);
    _phoneController.text = widget.viewModel.subscriptionForm.phoneNumber;
    _phoneController.addListener(_onChanged);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _phoneController.removeListener(_onChanged);
    _phoneController.dispose();

    super.dispose();
  }

  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
       // Keep only digits and + characters. Validator check that there is no letter in it
      ..phoneNumber = _phoneController.text == '' ? null : _phoneController.text.replaceAll(RegExp(r'[^0-9+]'), '')
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }
  }
}


@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final Function nextStep;

  _ViewModel({
    this.subscriptionForm,
    this.previousStep,
    this.exit,
    this.onChanged,
    this.nextStep
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
    );
  }
}
