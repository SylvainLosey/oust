import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../utils/colors.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../presentation/success_page.dart';

class LiftBookFormSubmit extends StatelessWidget {
  static int step = 4;

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

        return SuccessPage(title: "Rendez-vous fixé!", text: "Nous passerons chez toi bientôt", error: viewModel.error);
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final String error;

  _ViewModel({this.isLoading, this.error});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.liftBookFormState.isLoading,
      error: store.state.liftBookFormState.error,
    );
  }
}
