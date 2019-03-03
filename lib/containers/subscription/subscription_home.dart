import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../components/error_text.dart';
import '../../components/loading.dart';
import '../../components/location_card.dart';
import '../../components/payment_card.dart';
import '../../components/pickup_card.dart';
import '../../components/title.dart';
import '../../models/app_state.dart';
import '../../models/subscription_state.dart';

class SubscriptionHome extends StatelessWidget {
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
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 50,),
              TextTitle('Prochain passage'),
              PickupCard(
                date: viewModel.subscriptionState.pickups[0].pickupDate,
                hour: '08:00 - 10:00'
              ),
              TextTitle('Moyen de paiement'),
              PaymentCard(paymentType: 'Facture'),
              TextTitle('Emplacement'),
              LocationCard(
                address: viewModel.subscriptionState.subscription.address,
                postcode: viewModel.subscriptionState.subscription.postcode,
                city: viewModel.subscriptionState.subscription.city,
              )
            ],
          ),
          )
        );
      },
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




