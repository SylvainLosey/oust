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
import '../../redux/pickup/pickup_actions.dart';
import '../../data/models/pickup.dart';
import '../../utils/layout.dart';
import 'pickup_dialogs.dart';
import 'edit_pickup_note.dart';

class PickupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isLoading) {
          return Scaffold(body: Center(child: Loading()));
        }

        if (viewModel.error != null) {
          return ErrorText(error: viewModel.error);
        }

        final List<TimelineModel> items = <TimelineModel>[];
        final BuiltMap<int, Pickup> pickupFromToday = Pickup.getFuturePickups(viewModel.pickups);
        pickupFromToday.forEach((int index, Pickup pickup) =>
            items.add(_buildTimelineModel(context: context, pickup: pickup, viewModel: viewModel)));

        return Scaffold(
            body: Timeline(
          lineColor: Colors.grey[400],
          lineWidth: 2,
          children: items,
          position: TimelinePosition.Left,
        ));
      },
    );
  }

  TimelineModel _buildTimelineModel({BuildContext context, Pickup pickup, _ViewModel viewModel}) {
    return TimelineModel(
        Container(
          padding: EdgeInsets.symmetric(vertical: Layout.of(context).gridUnit(1)),
          child: PickupCard(
              pickup: pickup,
              isExpandable: true,
              onPushBack: () => pushBackPickupDialog(
                  context: context, onPushBackPickup: viewModel.onPushBackPickup, pickup: pickup),
              onDelete: () => deletePickupDialog(
                  context: context, onDeletePickup: viewModel.onDeletePickup, pickup: pickup),
              onAddNote: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditPickupNote(pickup: pickup)))),
        ),
        iconBackground: pickup.isInvoiced ? Colors.teal[300] : Colors.grey[400]);
  }
}

@immutable
class _ViewModel {
  final bool isLoading;
  final String error;
  final BuiltMap<int, Pickup> pickups;
  final Function onPushBackPickup;
  final Function onDeletePickup;

  _ViewModel(
      {this.isLoading, this.error, this.pickups, this.onPushBackPickup, this.onDeletePickup});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.pickupState.isLoading,
        error: store.state.pickupState.error,
        pickups: store.state.pickupState.pickups,
        onPushBackPickup: (Pickup pickup) => store.dispatch(PushBackPickupRequest(pickup: pickup)),
        onDeletePickup: (Pickup pickup) => store.dispatch(DeletePickupRequest(pickup: pickup)));
  }
}
