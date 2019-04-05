import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../presentation/error_text.dart';
import '../presentation/loading.dart';
import '../presentation/location_card.dart';
import '../presentation/payment_card.dart';
import '../presentation/pickup_card.dart';
import '../presentation/title.dart';
import '../../redux/app/app_state.dart';
import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../utils/layout.dart';
import '../../utils/pickup_utils.dart';
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

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildStack(context),
            Container(height: Layout.of(context).gridUnit(14)),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1.5)),
              child: Text(
                'Prochain passage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
              )
            ),
            Container(height: Layout.of(context).gridUnit(2)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(2)),
              child: PickupCard(date: DateTime.now(), hour: '08:00 - 10:00')
            ),
            Container(height: Layout.of(context).gridUnit(4)),
            FlatButton(
              onPressed: () {},
              child: Text('Tous les passages')
            )

              

          ],
        );
      },
    );
  }
}




Widget _buildStack(BuildContext context) {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    overflow: Overflow.visible,
    children: <Widget>[
      Container(
        height: Layout.of(context).gridUnit(40),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 10, blurRadius: 10, color: Colors.grey.withOpacity(0.2))]
        )
      ),
      Container(
        height: Layout.of(context).gridUnit(40),
        child: GoogleMap(
          // onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(46.816275, 6.942547),
            zoom: 13.0,
          ),
        )
      ),
      Container(
        height:  Layout.of(context).gridUnit(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.white.withOpacity(0), Colors.white],
            stops: [0.2, 0.9],
          ),
        ),
      ),
      Positioned(
        bottom: Layout.of(context).gridUnit(14),
        child: Icon(Icons.place, size: 45, color: Color(0xFF23836D))
      ),
      Positioned(
        bottom:  Layout.of(context).gridUnit(7),
        child: Text(
          'Nicholas Cooper',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
        )
      ),
      Positioned(
        bottom: Layout.of(context).gridUnit(5),
        child: Text(
          'Passage toutes les 2 semaines',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)
        )
      ),
      Positioned(
        bottom: -Layout.of(context).gridUnit(2),
        child: Container(
          height: 35,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[Color(0xFF23836D), Color(0xFF00B78E)]
            ),
            boxShadow: [BoxShadow(spreadRadius: 3, blurRadius: 10, color: Colors.grey.withOpacity(0.4))]
          ),
          child: Center(child: Text('Abonnement standard', style: TextStyle(color: Colors.white)))
        )
      )
    ],
  );     
}





@immutable
class _ViewModel {
  final bool isLoading;
  final String error;
  final Subscription subscription;
  // final List<Pickup> pickups;

  _ViewModel({
    @required this.isLoading,
    @required this.error,
    @required this.subscription,
    // @required this.pickups,

  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.subscriptionState.isLoading,
      error: store.state.subscriptionState.error,
      subscription: store.state.subscriptionState.subscription,
      // pickups: store.state.subscriptionState.pickups,
    );
  }
}




