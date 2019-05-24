import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../../utils/layout.dart';
import '../../../../../utils/colors.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../presentation/error_text.dart';
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

        return Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Spacer(flex: 4),
                        if (viewModel.error != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Oups !', style: Theme.of(context).textTheme.title),
                              Text(
                                'Il semble qu\'une erreur se soit produite durant ton inscription. Contacte-nous au 079 476 87 07 ou à info@oust.ch pour que nous arrangions tout ça',
                                textAlign: TextAlign.center,
                              ),
                              Container(height: Layout.of(context).gridUnit(10)),
                              Text('Message d\'erreur'),
                              ErrorText(
                                error: viewModel.error,
                              )
                            ],
                          )
                        else
                          Row(children: <Widget>[
                            // SizedBox(
                            //   height: 80,
                            //   width: 100,
                            //   child: FlareActor(
                            //     'assets/flare/success.flr',
                            //     animation: 'pop'
                            //     )
                            //   ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Bien recu !', style: Theme.of(context).textTheme.title),
                                Text('Nous passerons chez toi vider tes caisses de tri bientôt :)')
                              ],
                            ))
                          ]),
                        Spacer(flex: 6),
                        RaisedButton(
                            child: Text('Terminer',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                            onPressed: viewModel.exit),
                      ],
                    ))));
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
