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
import '../../models/pickup.dart';
import '../../models/subscription.dart';
import '../../presentation/layout.dart';
import 'pickup_list.dart';

class SubscriptionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {

        if (viewModel.isLoading) {
          return Loading();
        }

        if (viewModel.error != null) {
          return ErrorText(error: viewModel.error);
        }
        
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // TEMPORARY
                Container(
                  padding: EdgeInsets.symmetric(vertical: LayoutContainer.of(context).matGridUnit(scale:8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Abonnement ${viewModel.subscription.package.name}',
                        style: Theme.of(context).textTheme.headline,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        viewModel.subscription.representation,
                        style: Theme.of(context).textTheme.subhead,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                //

                TextTitle('Prochain passage'),
                PickupCard(
                  date: viewModel.pickups[0].pickupDate,
                  hour: '08:00 - 10:00'
                ),
                Align(
                  child: FlatButton(
                    child: Text(
                      'Voir tous les passages',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => PickupList())
                      );
                    },
                  ),
                ),
                TextTitle('Moyen de paiement'),
                PaymentCard(paymentType: 'Facture'),
                TextTitle('Emplacement'),
                LocationCard(
                  address: viewModel.subscription.address,
                  postcode: viewModel.subscription.postcode,
                  city: viewModel.subscription.city,
                )
              ],
            ),
            )
          ),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final bool isLoading;
  final String error;
  final Subscription subscription;
  final List<Pickup> pickups;

  _ViewModel({
    @required this.isLoading,
    @required this.error,
    @required this.subscription,
    @required this.pickups,

  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.subscriptionState.isLoading,
      error: store.state.subscriptionState.error,
      subscription: store.state.subscriptionState.subscription,
      pickups: store.state.subscriptionState.pickups,
    );
  }
}




