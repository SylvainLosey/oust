import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/postcode.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/validators.dart';
import '../../../presentation/error_text.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';


class SubscriptionFormLead extends StatelessWidget {
  static int step = 100;

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
            body: EmailForm(viewModel),
          )
        );
      },
    );
  }
}



class EmailForm extends StatefulWidget {
  final _ViewModel viewModel;

  EmailForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => EmailFormState();
}

class EmailFormState extends State<EmailForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Oh non !',
        subtitle: 'Malheureusement nous n\'allons pas encore jusque chez toi. Tu peux entrer ton email ci-dessous pour recevoir une notification et un crédit de 20.- dès que nous y seront disponibles'
      ),
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              validator: emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@gmail.com',
              ),
            ),
            if (widget.viewModel.error != null)
              ErrorText(error: widget.viewModel.error)
          ]
        )
      ),
      button: RaisedButton(
        child: widget.viewModel.isLoading 
          ? SpinKitThreeBounce(color: Colors.white, size: 18)
          : Text('Enregistrer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.isLoading
          ? null
          : _emailController.text.length < 3 
            ? null
            : () {
              if (_formKey.currentState.validate()) {
                widget.viewModel.postLeadRequest(widget.viewModel.subscriptionForm);
              }
            }
      ),
    );
  }


  @override
  void didChangeDependencies() {
    _emailController.removeListener(_onChanged);
    _emailController.text = widget.viewModel.subscriptionForm.email;
    _emailController.addListener(_onChanged);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.removeListener(_onChanged);
    _emailController.dispose();

    super.dispose();
  }

  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..email = _emailController.text == '' ? null : _emailController.text.trim()
    );

    if (subscriptionForm != widget.viewModel.subscriptionForm) {
      widget.viewModel.onChanged(subscriptionForm);
    }
  }
}


@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final bool isLoading;
  final String error;
  final Function postLeadRequest;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final BuiltMap<int, Postcode> postcodes;


  _ViewModel({
    this.subscriptionForm,
    this.isLoading,
    this.error,
    this.postLeadRequest,
    this.previousStep,
    this.exit,
    this.onChanged,
    this.postcodes
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      isLoading: store.state.subscriptionFormState.isLoading,
      error: store.state.subscriptionFormState.error,
      postLeadRequest: (SubscriptionForm subscriptionForm) {
        store.dispatch(PostLeadRequest(subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..leadStatus = 'postcode_not_covered')));
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      postcodes: store.state.dataState.postcodes,
     );
  }
}
