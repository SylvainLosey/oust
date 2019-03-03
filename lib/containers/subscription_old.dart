import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:redux/redux.dart';

import '../components/error_text.dart';
import '../components/loading.dart';
import '../models/app_state.dart';
import '../models/pickup.dart';
import '../models/subscription.dart';
import '../models/subscription_state.dart';
import '../services/utils.dart';

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

        // final List<Pickup> pickups = viewModel.subscriptionState.pickups;

        // List<TimelineModel> items = [];
        // for (Pickup pickup in pickups) {
        //   items.add(_buildPickup(pickup));
        // }

        // return Timeline(children: items, position: TimelinePosition.Left, iconSize: 16,);
      
        // return Container(
        //   child: _pickups(context, viewModel)
        // );
        
        
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _createColumn(context, viewModel),
              // _pickups(context, viewModel),
            ],
          )
        );

        
      },
    );
  }

  Widget _createColumn(BuildContext context, _ViewModel viewModel) {
    final Subscription subscription = viewModel.subscriptionState.subscription;

    return Padding(
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
                )
              ),
              Text(
                'Abonnement ${subscription.package.name} - ${subscription.package.length}',
                style:TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                )
              ),
              // Container(
              //   height: 20,
              // ),
            ],
          ),
      );
  }

  Widget _pickups(BuildContext context, _ViewModel viewModel) {
    final List<Pickup> pickups = viewModel.subscriptionState.pickups;


    List<TimelineModel> items = [];
    for (Pickup pickup in pickups) {
      if (pickup.pickupDate.isAfter(DateTime.now())) {
        items.add(_buildPickup(pickup));
      }
    }

    return Timeline(children: items, position: TimelinePosition.Left, shrinkWrap: true, iconSize: 16,);
  }

  TimelineModel _buildPickup(Pickup pickup) {
    return TimelineModel(
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        width: 450,
        height: 37,
        color: Colors.white,
        child: Text(
          dateToStringFrench(pickup.pickupDate),
          style:TextStyle(color: Colors.black)
        ),
      ),
      position: TimelineItemPosition.left,
      // iconBackground: darkAccentColor,
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




