import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../data/models/pickup.dart';
import '../../redux/app/app_state.dart';
import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';
import '../../utils/datetime.dart';
import '../../redux/pickup/pickup_actions.dart';
import '../presentation/main_app_bar.dart';

typedef OnSaveCallback = Function(String note);

class EditPickupNote extends StatelessWidget {
  final Pickup pickup;

  EditPickupNote({this.pickup});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnSaveCallback>(
      distinct: true,
      converter: (Store<AppState> store) {
        return (String note) {
          store.dispatch(UpdatePickupRequest(pickup: pickup.rebuild((PickupBuilder b) => b..customerNote = note)));
          store.dispatch(LoadPickupsRequest(subscription: store.state.subscriptionState.subscription));
          Navigator.of(context).pop();
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return EditPickupNoteForm(
          pickup,
          onSave,
        );
      },
    );
  }
}

class EditPickupNoteForm extends StatefulWidget {
  final Pickup pickup;
  final OnSaveCallback onSave;

  EditPickupNoteForm(this.pickup, this.onSave);

  @override
  State<StatefulWidget> createState() => EditPickupNoteFormState();
}

class EditPickupNoteFormState extends State<EditPickupNoteForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: TitleFormButton(
          title: TitleWidget(
              title: 'Passage du ${weekdayAndDate(context, widget.pickup.pickupDate.toLocal())}',
              subtitle: 'Si quelque chose sera un peu spécial pour ce passage, fais le nous savoir ici.'),
          form: Form(
            key: _formKey,
            child: TextFormField(
              initialValue: widget.pickup.customerNote,
              onSaved: (String value) => _note = value,
              decoration: InputDecoration(
                labelText: 'Remarque',
              ),
            ),
          ),
          button: RaisedButton(
              child: Text('Enregistrer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
              onPressed: () {
                _formKey.currentState.save();
                widget.onSave(_note);
              }),
        ));
  }
}
