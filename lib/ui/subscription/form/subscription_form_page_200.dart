import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:redux/redux.dart';

import '../../../data/models/postcode.dart';
import '../../../data/models/subscription_form.dart';
import '../../../redux/app/app_state.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../../utils/validators.dart';
import '../../presentation/error_text.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';


class SubscriptionFormAppointment extends StatelessWidget {
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
            body: AppointmentForm(viewModel),
          )
        );
      },
    );
  }
}


enum ContactMethod {phone, email}

class AppointmentForm extends StatefulWidget {
  final _ViewModel viewModel;

  AppointmentForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => AppointmentFormState();
}

class AppointmentFormState extends State<AppointmentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  List<TextEditingController> _controllers = <TextEditingController>[];

  ContactMethod _contactMethod;

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Rendez-vous',
        subtitle: 'Entres tes coordonées ci-dessous et nous te recontacterons pour fixer un rendez-vous',
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
            Container(height: Layout.of(context).gridUnit(2)),
            TextFormField(
              controller: _phoneController,
              validator: phoneValidator,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Téléphone',
                hintText: '079 433 01 92',
              ),
            ),
            Container(height: Layout.of(context).gridUnit(6)),
            Text('Me contacter par', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500)),
            Container(height: Layout.of(context).gridUnit(2)),
            RadioListTile<ContactMethod>(
              title: const Text('Téléphone'),
              value: ContactMethod.phone,
              groupValue: _contactMethod,
              onChanged: (ContactMethod value) { setState(() { _contactMethod = value; _onChanged();}); },
            ),
            RadioListTile<ContactMethod>(
              title: const Text('Email'),
              value: ContactMethod.email,
              groupValue: _contactMethod,
              onChanged: (ContactMethod value) { setState(() { _contactMethod = value; _onChanged();}); },
            ),
            // TODO - Replace by collection if when Dart 2.3 is out
            widget.viewModel.error != null ? ErrorText(error: widget.viewModel.error) : null,
          ].where((Widget widget) => widget != null).toList(),
        )
      ),
      button: RaisedButton(
        child: widget.viewModel.isLoading 
          ? SpinKitThreeBounce(color: Colors.white, size: 18)
          : Text('Enregistrer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.isLoading
          ? null
          : _emailController.text.length < 3 || _phoneController.text.length < 3 || _contactMethod == null
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
    if (_controllers.isNotEmpty) {
      return;
    }
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm;

    _emailController.text = subscriptionForm.email;
    _phoneController.text = subscriptionForm.phoneNumber;

    _controllers = <TextEditingController>[
      _emailController,
      _phoneController
    ];
    _controllers.forEach((dynamic controller) => controller.addListener(_onChanged));

    super.didChangeDependencies();
  }


  @override
  void dispose() {
    _controllers.forEach((dynamic controller) {
      controller.removeListener(_onChanged);
      controller.dispose();
    });

    super.dispose();
  }


  void _onChanged() {
    final SubscriptionForm subscriptionForm = widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..email = _emailController.text == '' ? null : _emailController.text.trim()
      // Keep only digits and + characters. Validator check that there is no letter in it
      ..phoneNumber = _phoneController.text == '' ? null : _phoneController.text.replaceAll(RegExp(r'[^0-9+]'), '')
      ..contactMethod = _contactMethod?.toString()?.substring(14)
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
        store.dispatch(PostLeadRequest(subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..leadStatus = 'requested_appointment')));
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      postcodes: store.state.dataState.postcodes,
     );
  }
}
