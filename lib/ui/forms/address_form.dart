import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../data/models/postcode.dart';
import '../../utils/layout.dart';
import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';

class AddressForm extends StatefulWidget {
  final AddressFormVM viewModel;

  AddressForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  List<TextEditingController> _controllers = <TextEditingController>[];

  final FocusNode _addressNode = FocusNode();
  final FocusNode _postcodeNode = FocusNode();
  List<FocusNode> _focusNodes;

  // On load set controllers to value stored in redux and add onChanged listeners
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(title: 'Où habites-tu ?', subtitle: 'Complète les champs ci-dessous'),
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
                textCapitalization: TextCapitalization.sentences,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_postcodeNode);
                },
              ),
              Container(height: Layout.of(context).gridUnit(2)),
              TypeAheadFormField(
                suggestionsBoxVerticalOffset: 24,
                textFieldConfiguration: TextFieldConfiguration(
                    controller: _postcodeController,
                    focusNode: _postcodeNode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Code postal et localité',
                        suffixIcon: _postcodeController.text.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  widget.viewModel.onChanged(widget.viewModel.form.rebuild((b) => b..postcode = null));
                                  _postcodeController.text = '';
                                }))),
                suggestionsCallback: _suggestionCallback,
                onSuggestionSelected: _onSuggestionSelected,
                itemBuilder: _itemBuilder,
                noItemsFoundBuilder: _noItemsFoundBuilder,
              ),
            ],
          )),
      button: RaisedButton(
          child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
          onPressed: _addressController.text.isNotEmpty && widget.viewModel.selectedPostcode != null
              ? () {
                  if (_formKey.currentState.validate())
                    widget.viewModel.nextStep(widget.viewModel.postcodes[widget.viewModel.selectedPostcode]);
                }
              : null),
    );
  }

  List<Postcode> _suggestionCallback(String pattern) {
    return Postcode.getSuggestions(pattern, widget.viewModel.postcodes.toMap());
  }

  void _onSuggestionSelected(Postcode postcode) {
    widget.viewModel.onChanged(widget.viewModel.form.rebuild((b) => b..postcode = postcode.id));
    _postcodeController.text = '${postcode.postcode} ${postcode.name}';
  }

  ListTile _itemBuilder(BuildContext context, Postcode postcode) {
    return ListTile(title: Text('${postcode.postcode} ${postcode.name}'));
  }

  Widget _noItemsFoundBuilder(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16), child: Text('Aucun code postal ou localité trouvé'));
  }

  @override
  void didChangeDependencies() {
    if (_controllers.isNotEmpty) {
      return;
    }

    _addressController.text = widget.viewModel.form.address;
    _postcodeController.text = widget.viewModel.selectedPostcode != null
        ? '${widget.viewModel.postcodes[widget.viewModel.selectedPostcode].postcode} ${widget.viewModel.postcodes[widget.viewModel.selectedPostcode].name}'
        : '';

    _controllers = <TextEditingController>[
      _addressController,
      _postcodeController,
    ];

    _controllers.forEach((TextEditingController controller) => controller.addListener(_onChanged));

    _focusNodes = <FocusNode>[_addressNode, _postcodeNode];

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
    final dynamic form = widget.viewModel.form
        .rebuild((b) => b..address = _addressController.text == '' ? null : _addressController.text.trim());

    if (form != widget.viewModel.form) {
      widget.viewModel.onChanged(form);
    }
  }
}

abstract class AddressFormVM {
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final BuiltMap<int, Postcode> postcodes;
  final dynamic form;
  final int selectedPostcode;

  AddressFormVM({
    @required this.nextStep,
    @required this.previousStep,
    @required this.exit,
    @required this.onChanged,
    @required this.postcodes,
    @required this.form,
    @required this.selectedPostcode,
  });
}
