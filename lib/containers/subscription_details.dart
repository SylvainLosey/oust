import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../components/error_text.dart';
import '../components/loading.dart';
import '../components/partial_bold_text.dart';
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
            padding: const EdgeInsets.all(16),
            child: _createColumn(context, viewModel),
          ),
        );
      },
    );
  }

  Column _createColumn(BuildContext context, _ViewModel viewModel) {
    final Subscription subscription = viewModel.subscriptionState.subscription;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PartialBoldText(
          boldText: 'Nom: ',
          normalText: subscription.representation,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Adresse: ',
          normalText: subscription.address,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Localité: ',
          normalText: '${subscription.postcode} ${subscription.city}',
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Abonnement: ',
          normalText: subscription.package.name,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Passage restants: ',
          normalText: subscription.remainingPickups.toString(),
          defaultText: 'Not set',
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
