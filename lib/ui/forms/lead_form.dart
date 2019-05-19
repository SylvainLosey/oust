import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/models/postcode.dart';
import '../../utils/validators.dart';
import '../presentation/error_text.dart';
import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';

class LeadForm extends StatefulWidget {
  final LeadVM viewModel;

  LeadForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => LeadFormState();
}

class LeadFormState extends State<LeadForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
          title: 'Oh non !',
          subtitle:
              'Malheureusement nous n\'allons pas encore jusque chez toi. Tu peux entrer ton email ci-dessous pour recevoir une notification et un crédit de 20.- dès que nous y seront disponibles'),
      form: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            TextFormField(
              controller: _emailController,
              validator: emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@gmail.com',
              ),
            ),
            if (widget.viewModel.error != null) ErrorText(error: widget.viewModel.error)
          ])),
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
                        widget.viewModel.postLeadRequest(widget.viewModel.form);
                      }
                    }),
    );
  }

  @override
  void didChangeDependencies() {
    _emailController.removeListener(_onChanged);
    _emailController.text = widget.viewModel.form.email;
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
    final dynamic form = widget.viewModel.form
        .rebuild((b) => b..email = _emailController.text == '' ? null : _emailController.text.trim());

    if (form != widget.viewModel.form) {
      widget.viewModel.onChanged(form);
    }
  }
}

abstract class LeadVM {
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final Function postLeadRequest;
  final BuiltMap<int, Postcode> postcodes;
  final dynamic form;
  final bool isLoading;
  final String error;

  LeadVM(
      {this.form,
      this.isLoading,
      this.error,
      this.postLeadRequest,
      this.previousStep,
      this.exit,
      this.onChanged,
      this.postcodes});
}
