import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../../utils/colors.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../presentation/success_page.dart';

import '../../../../../redux/auth/auth_actions.dart';

class LiftQuoteFormSubmit extends StatelessWidget {
  static int step = 6;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isLoading) {
          return Scaffold(
              body: Center(
                  child: SpinKitWanderingCubes(
            color: primaryColor,
            size: 50.0,
          )));
        }

        return SuccessPage(
            title: 'Bien recu !',
            text: 'Nous t\'enverrons une notification quand le prix aura été fixé, d\'ici une heure normalement. :)',
            error: viewModel.error);
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final String error;
  final Function exit;

  _ViewModel({this.isLoading, this.error, this.exit});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.liftQuoteFormState.isLoading,
        error: store.state.liftQuoteFormState.error,
        exit: () {
          // TODO This is not used anymore here - update in successpage

          // If subscription creation failed we reset everyting and logout the user potentially created
          // Otherwise we get an incomplete subscription messing everyting up.
          // This should never happen and cause of it must be fixed imediately
          if (store.state.liftQuoteFormState.error != null) {
            store.dispatch(UserLogout());
          }
          store.dispatch(LiftQuoteFormExit());
        });
  }
}
