import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../components/error_text.dart';
import '../components/loading.dart';
import '../components/partial_bold_text.dart';
import '../models/app_state.dart';
import '../models/customer.dart';
import '../models/customer_state.dart';

class CustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.customerState.isLoading) {
          return Loading();
        }

        if (viewModel.customerState.error != null) {
          return ErrorText(error: viewModel.customerState.error);
        }

        return Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: _createColumn(context, viewModel),
            ), 
        );
      },
    );
  }

  Column _createColumn(BuildContext context, _ViewModel viewModel) {
    final Customer customer = viewModel.customerState.customer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PartialBoldText(
          boldText: 'Client: ',
          normalText: '${customer.firstName} ${customer.lastName}',
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Adresse: ',
          normalText: customer.address,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Localité: ',
          normalText: '${customer.postcode} ${customer.city}',
          defaultText: 'Not set',
        ),
      ],
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
