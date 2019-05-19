import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/layout.dart';
import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';

// Notes on the stucture of form pages
// It is best to keep the form and button in the same Stateful widget to avoid having to pass State up/down
// There needs to be a Stateful widget below storeprovider in the hierarchy, placing it above would leave it without acces to the viewmodel
// Don't try to refactor this unless you are sure - Columns and Spaced/Flex widget when nested don't go well together
class NameForm extends StatefulWidget {
  final NameFormVM viewModel;

  NameForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => NameFormState();
}

class NameFormState extends State<NameForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  List<TextEditingController> _controllers = <TextEditingController>[];

  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _lastNameNode = FocusNode();
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
                inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)],
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_lastNameNode)),
            Container(height: Layout.of(context).gridUnit(2)),
            TextFormField(
              controller: _lastNameController,
              focusNode: _lastNameNode,
              decoration: InputDecoration(labelText: 'Nom'),
              textInputAction: TextInputAction.done,
              inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(50)],
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (_) => widget.viewModel.nextStep(),
            ),
          ],
        ),
      ),
      button: RaisedButton(
          child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
          onPressed: _firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty
              ? widget.viewModel.nextStep
              : null),
    );
  }

  @override
  void didChangeDependencies() {
    _controllers = <TextEditingController>[
      _firstNameController,
      _lastNameController,
    ];

    _focusNodes = <FocusNode>[_firstNameNode, _lastNameNode];

    _controllers.forEach((TextEditingController controller) => controller.removeListener(_onChanged));
    _firstNameController.text = widget.viewModel.form.firstName;
    _lastNameController.text = widget.viewModel.form.lastName;
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
    // At each field change send value to redux store
    final dynamic form = widget.viewModel.form.rebuild((b) => b
      ..firstName = _firstNameController.text == '' ? null : _firstNameController.text.trim()
      ..lastName = _lastNameController.text == '' ? null : _lastNameController.text.trim());

    if (form != widget.viewModel.form) {
      widget.viewModel.onChanged(form);
    }
  }
}

abstract class NameFormVM {
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final dynamic form;

  NameFormVM(
      {@required this.nextStep,
      @required this.previousStep,
      @required this.exit,
      @required this.onChanged,
      @required this.form});
}
