import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';


class SubscriptionFormAccount extends StatelessWidget {
  static int step = 14;

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
            body: AccountForm(viewModel),
          )
        );
      },
    );
  }
}


class AccountForm extends StatefulWidget {
  final _ViewModel viewModel;

  AccountForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => AccountFormState();
}

class AccountFormState extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<TextEditingController> _controllers;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  List<FocusNode> _focusNodes;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Compte',
        subtitle: 'Dernière étape, merci d\'entrer ton email et un mot de passe pour créer ton compte.'
      ),
      form: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              validator: emailValidator,
              focusNode: _emailNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordNode),
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            Container(height: Layout.of(context).gridUnit(2)),
            TextFormField(
              controller: _passwordController,
              validator: passwordValidator,
              focusNode: _passwordNode,
              obscureText: _obscureText,
              // onFieldSubmitted: (_) {
              //   if (_formKey.currentState.validate()) {
              //     widget.viewModel.submit();
              //   }
              // },
              onFieldSubmitted: (_) => widget.viewModel.submit(),
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  padding: EdgeInsetsDirectional.only(end: 18),
                  icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                )
              ),
            )
          ]
        )
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _emailController.text.isEmpty || _passwordController.text.isEmpty
          ? null
          : () { if (_formKey.currentState.validate()) widget.viewModel.submit(); }
      ),
    );
  }


  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void didChangeDependencies() {
    _controllers = <TextEditingController>[
      _emailController,
      _passwordController
    ];
    
     _focusNodes = <FocusNode>[
      _emailNode,
      _passwordNode
    ];

    _controllers.forEach((TextEditingController controller) => controller.removeListener(_onChanged));

    _emailController.text = widget.viewModel.subscriptionForm.email;
    _passwordController.text = widget.viewModel.subscriptionForm.password;

    _controllers.forEach((TextEditingController controller) => controller.addListener(_onChanged));


    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllers.forEach((TextEditingController controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    _focusNodes.forEach((FocusNode node) => node.dispose());

    super.dispose();
  }

  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..email = _emailController.text == '' ? null : _emailController.text.trim()
      ..password = _passwordController.text == '' ? null : _passwordController.text.trim()
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
  final Function submit;

  _ViewModel({
    this.subscriptionForm,
    this.previousStep,
    this.exit,
    this.onChanged,
    this.submit
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      submit: () {
        store.dispatch(SubmitSubscriptionFormRequest());
        store.dispatch(SubscriptionFormNextStep());
      }
    );
  }
}
