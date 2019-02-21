import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../components/error_text.dart';
import '../components/loading.dart';
// import '../components/partial_bold_text.dart';
import '../models/app_state.dart';
import '../models/subscription.dart';
import '../models/subscription_state.dart';

class SubscriptionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.subscriptionState.isLoading) {
          return Loading();
        }

        if (viewModel.subscriptionState.error != null) {
          return ErrorText(error: viewModel.subscriptionState.error);
        }

        return SingleChildScrollView(
          child: Container(
            // padding: const EdgeInsets.all(16),
            child: _createColumn(context, viewModel),
          ),
        );
      },
    );
  }

  Widget _createColumn(BuildContext context, _ViewModel viewModel) {
    final Subscription subscription = viewModel.subscriptionState.subscription;

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: Colors.black87,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70,
              ),
              Text(
                subscription.representation,
                style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
              Text(
                'Abonnement ${subscription.package.name} - ${subscription.package.length}',
                style:TextStyle(
                  fontSize: 16,
                  color: Colors.white
                  // fontWeight: FontWeight.bold,
                )
              ),
              Container(
                height: 60,
              ),
              Text(
                'Futur passages',
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black
                )
              ),
            ],
          ),
        ),

        ],
      );
  }
}

@immutable
class _ViewModel {
  final SubscriptionState subscriptionState;

  _ViewModel({
    @required this.subscriptionState,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionState: store.state.subscriptionState,
    );
  }
}