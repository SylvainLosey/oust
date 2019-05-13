import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../presentation/error_text.dart';
import '../presentation/loading.dart';
import '../../redux/app/app_state.dart';
import '../../redux/customer/customer_state.dart';

class CustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.customerState.fetchCount > 0) {
          return Loading();
        }

        if (viewModel.customerState.error != null) {
          return ErrorText(error: viewModel.customerState.error);
        }

        return Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text('${viewModel.customerState.customer.firstName} ${viewModel.customerState.customer.lastName}'),
            ), 
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final CustomerState customerState;

  _ViewModel({
    @required this.customerState,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      customerState: store.state.customerState,
    );
  }
}
