import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oust/ui/presentation/layout/empty_home_layout.dart';
import 'package:redux/redux.dart';

import '../../data/models/lift_quote_form.dart';
import '../../redux/app/app_state.dart';
import '../../redux/subscription/form/subscription_form_actions.dart';
import '../presentation/title_widget.dart';

class LiftEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return EmptyHomeLayout(
            title: TitleWidget(title: 'Passage unique', subtitle: 'Débarasse toi de n\'importe quoi en une photo'),
            button: RaisedButton(onPressed: null, child: Text('Decouvrir')),
          );
        });
  }
}

@immutable
class _ViewModel {
  final LiftQuoteForm liftQuoteForm;
  final Function start;

  _ViewModel({this.liftQuoteForm, this.start});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        liftQuoteForm: store.state.liftState.liftQuoteFormState.liftQuoteForm,
        start: () => store.dispatch(SubscriptionFormStart()));
  }
}
