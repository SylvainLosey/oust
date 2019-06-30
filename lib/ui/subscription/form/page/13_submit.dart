import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/colors.dart';
import '../../../../redux/app/app_state.dart';
import '../../../presentation/success_page.dart';
import '../../../../redux/auth/auth_actions.dart';

class SubscriptionFormSubmit extends StatelessWidget {
  static int step = 15;

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
            title: 'Abonnement créé !',
            text: 'Nous passerons chez toi vider tes caisses de tri bientôt :)',
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
        isLoading: store.state.subscriptionFormState.isLoading,
        error: store.state.subscriptionFormState.error,
        exit: () {
          // TODO: not used anymore here, update in succes Page

          // If subscription creation failed we reset everyting and logout the user potentially created
          // Otherwise we get an incomplete subscription messing everyting up.
          // This should never happen and cause of it must be fixed imediately
          if (store.state.subscriptionFormState.error != null) {
            store.dispatch(UserLogout());
          }
          store.dispatch(SubscriptionFormExit());
        });
  }
}
