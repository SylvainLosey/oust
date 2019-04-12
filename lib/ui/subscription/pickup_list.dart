import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../presentation/error_text.dart';
import '../presentation/loading.dart';
import '../presentation/pickup_card.dart';
import '../../redux/app/app_state.dart';
import '../../data/models/pickup.dart';

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
        final BuiltMap<int, Pickup> pickupFromToday = Pickup.getFuturePickups(viewModel.pickups);
        pickupFromToday.forEach((int index, Pickup pickup) => items.add(_buildTimelineModel(pickup)));

        return Scaffold(
          body:  Timeline(
            children: items, 
            position: TimelinePosition.Left, 
            iconSize: 16,
          )
        );
        // return Container();
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
  final BuiltMap<int, Pickup> pickups;

  _ViewModel({
    @required this.isLoading,
    @required this.error,
    @required this.pickups,

  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.pickupState.isLoading,
      error: store.state.pickupState.error,
      pickups: store.state.pickupState.pickups,
    );
  }
}



