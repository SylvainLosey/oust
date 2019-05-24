import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../redux/app/app_state.dart';
import '../../../../../data/models/lift_quote_form.dart';
import '../../../../../utils/layout.dart';
import '../../../../presentation/layout/title_form_button_layout.dart';
import '../../../../presentation/title_widget.dart';
import '../../../../presentation/selectable.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';

class LiftQuoteFormFloor extends StatelessWidget {
  static int step = 2;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FormWrapper(child: FloorForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class FloorForm extends StatefulWidget {
  final _ViewModel viewModel;
  FloorForm(this.viewModel);

  @override
  _FloorFormState createState() => _FloorFormState();
}

class _FloorFormState extends State<FloorForm> {
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(
          title: 'Emplacement',
          subtitle: 'Où se trouvent les choses que tu as à débarasser ?',
        ),
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'Étage',
                  style: Theme.of(context).textTheme.subtitle,
                )),
                Container(
                    child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.remove), iconSize: 18, onPressed: widget.viewModel.decrement),
                    Container(
                      padding: EdgeInsets.all(Layout.of(context).gridUnit(1)),
                      child: Text(_getFloorText(floor: widget.viewModel.floor),
                          style: Theme.of(context).textTheme.subtitle),
                    ),
                    IconButton(icon: Icon(Icons.add), iconSize: 18, onPressed: widget.viewModel.increment),
                  ],
                ))
              ],
            ),
            if (widget.viewModel.floor > 0) ...[
              Row(children: <Widget>[
                Expanded(
                  child: Text('Ascenceur', style: Theme.of(context).textTheme.subtitle),
                ),
                Switch(onChanged: widget.viewModel.toggleElevator, value: widget.viewModel.elevator)
              ])
            ],
            SizedBox(height: Layout.of(context).gridUnit(3)),
            Text(
              'Remarque',
              style: Theme.of(context).textTheme.subtitle,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: Layout.of(context).gridUnit(2)),
            TextFormField(
              controller: _noteController,
              decoration: InputDecoration(hintText: 'Optionnel'),
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              maxLines: 3,
            ),
            SizedBox(height: Layout.of(context).gridUnit(3)),
          ],
        ),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: widget.viewModel.nextStep));
  }

  String _getFloorText({int floor}) {
    switch (floor) {
      case 0:
        return 'Rez';
      case 1:
        return '1er';
      default:
        return '${floor}ème';
    }
  }

  @override
  void didChangeDependencies() {
    _noteController.removeListener(_onChanged);
    _noteController.text = widget.viewModel.note;
    _noteController.addListener(_onChanged);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _noteController.removeListener(_onChanged);
    _noteController.dispose();
    super.dispose();
  }

  void _onChanged() {
    final LiftQuoteForm liftQuoteForm = widget.viewModel.liftQuoteForm
        .rebuild((b) => b..note = _noteController.text == '' ? null : _noteController.text.trim());

    if (liftQuoteForm != widget.viewModel.liftQuoteForm) {
      widget.viewModel.onChanged(liftQuoteForm);
    }
  }
}

class _ViewModel {
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final LiftQuoteForm liftQuoteForm;
  final int floor;
  final bool elevator;
  final String note;
  final Function increment;
  final Function decrement;
  final Function toggleElevator;

  _ViewModel(
      {this.nextStep,
      this.previousStep,
      this.exit,
      this.onChanged,
      this.liftQuoteForm,
      this.floor,
      this.elevator,
      this.note,
      this.increment,
      this.decrement,
      this.toggleElevator});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        nextStep: () => store.dispatch(LiftQuoteFormNextStep(isAuthenticated: store.state.authState.isAuthenticated)),
        previousStep: () =>
            store.dispatch(LiftQuoteFormPreviousStep(isAuthenticated: store.state.authState.isAuthenticated)),
        exit: () => store.dispatch(LiftQuoteFormExit()),
        onChanged: (LiftQuoteForm liftQuoteform) => store.dispatch(UpdateLiftQuoteForm(liftQuoteform)),
        liftQuoteForm: store.state.liftQuoteFormState.liftQuoteForm,
        floor: store.state.liftQuoteFormState.liftQuoteForm.floor,
        elevator: store.state.liftQuoteFormState.liftQuoteForm.elevator,
        note: store.state.liftQuoteFormState.liftQuoteForm.note,
        increment: () => store.dispatch(LiftQuoteFormIncrementFloor()),
        decrement: () => store.dispatch(LiftQuoteFormDecrementFloor()),
        toggleElevator: (_) => store.dispatch(LiftQuoteFormToggleElevator()));
  }
}
