import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:redux/redux.dart';

import '../../presentation/error_text.dart';
import '../../presentation/loading.dart';
import '../../presentation/pickup_card.dart';
import '../../models/app_state.dart';
import '../../models/pickup.dart';
import '../../utils/pickup_utils.dart';

class PickupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isLoading) {
          return Loading();
        }

        if (viewModel.error != null) {
          return ErrorText(error: viewModel.error);
        }

        final List<TimelineModel> items = <TimelineModel>[];
        final List<Pickup> pickupFromToday = PickupUtils.getPickupsFromToday(viewModel.pickups);
        pickupFromToday.forEach((Pickup pickup) => items.add(_buildTimelineModel(pickup)));

        return Scaffold(
          body:  Timeline(
            children: items, 
            position: TimelinePosition.Left, 
            iconSize: 16,
          )
        );
      },
    );
  }

  TimelineModel _buildTimelineModel(Pickup pickup) {
    return TimelineModel(
      PickupCard(
        date: pickup.pickupDate,
        hour: '08:00-10:100'
      ),
      position: TimelineItemPosition.left,
      //iconBackground: darkAccentColor,
    );
  }
}



@immutable
class _ViewModel {
  final bool isLoading;
  final String error;
  final List<Pickup> pickups;

  _ViewModel({
    @required this.isLoading,
    @required this.error,
    @required this.pickups,

  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.subscriptionState.isLoading,
      error: store.state.subscriptionState.error,
      pickups: store.state.subscriptionState.pickups,
    );
  }
}



