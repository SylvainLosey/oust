import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../presentation/error_text.dart';
import '../presentation/loading.dart';
import '../presentation/pickup_card.dart';
import '../presentation/buttons.dart';
import '../../redux/app/app_state.dart';
import '../../redux/subscription/form/subscription_form_state.dart';
import '../../redux/pickup/pickup_actions.dart';
import '../../redux/pickup/pickup_state.dart';
import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/models/package.dart';
import '../../utils/layout.dart';
import 'pickup_list.dart';
import 'edit_pickup_note.dart';
import 'pickup_dialogs.dart';

class SubscriptionHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.fetchCount > 0 ||
            viewModel.subscriptionFormState.isLoading ||
            viewModel.pickupState.isLoading ||
            viewModel.subscription == null ||
            viewModel.pickups == null) {
          return Loading();
        }

        if (viewModel.error != null) {
          return ErrorText(error: viewModel.error);
        }

        final Pickup pickup = Pickup.getNextPickup(viewModel.pickups);

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildStack(context, viewModel),
            Container(height: Layout.of(context).gridUnit(14)),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1.5)),
                child: Text('Prochain passage',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
            Container(height: Layout.of(context).gridUnit(2)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(2)),
              child: PickupCard(
                  pickup: pickup,
                  onPushBack: () => pushBackPickupDialog(
                      context: context,
                      onPushBackPickup: viewModel.onPushBackPickup,
                      pickup: pickup),
                  onDelete: () => deletePickupDialog(
                      context: context, onDeletePickup: viewModel.onDeletePickup, pickup: pickup),
                  onAddNote: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditPickupNote(pickup: pickup)))),
            ),
            Container(height: Layout.of(context).gridUnit(4)),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context) => PickupList()));
                },
                child: Text('Tous les passages'))
          ],
        );
      },
    );
  }
}

Widget _buildStack(BuildContext context, _ViewModel viewModel) {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    overflow: Overflow.visible,
    children: <Widget>[
      Container(
          height: Layout.of(context).gridUnit(40),
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(spreadRadius: 10, blurRadius: 10, color: Colors.grey.withOpacity(0.2))
          ])),
      if (viewModel.subscription.position != null)
        // Container(
        //     height: Layout.of(context).gridUnit(40),
        //     child: GoogleMap(
        //       initialCameraPosition: CameraPosition(
        //         target:
        //             LatLng(viewModel.subscription.position[0], viewModel.subscription.position[1]),
        //         zoom: 14.0,
        //       ),
        //     )),
        Container(
          height: Layout.of(context).gridUnit(40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.white.withOpacity(0), Colors.white],
              stops: <double>[0.2, 0.9],
            ),
          ),
        ),
      Positioned(
          bottom: Layout.of(context).gridUnit(14),
          child: Icon(Icons.place, size: 45, color: Color(0xFF23836D))),
      Positioned(
          bottom: Layout.of(context).gridUnit(7),
          child: Text(viewModel.subscription.representation,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      Positioned(
          bottom: Layout.of(context).gridUnit(5),
          child: Text(
              'Passage toutes les ${viewModel.packages[viewModel.consumerSubscription.package].frequencyWeeks} semaines',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300))),
      Positioned(
          bottom: -Layout.of(context).gridUnit(2),
          child: GradientButton(
              onPressed: () {
                print('Hello');
              },
              child: Text(
                  'Abonnement ${viewModel.packages[viewModel.consumerSubscription.package].name}',
                  style: TextStyle(color: Colors.white))))
    ],
  );
}

@immutable
class _ViewModel {
  final int fetchCount;
  final String error;
  final Subscription subscription;
  final ConsumerSubscription consumerSubscription;
  final BuiltMap<int, Package> packages;
  final BuiltMap<int, Pickup> pickups;
  final SubscriptionFormState subscriptionFormState;
  final PickupState pickupState;
  final Function onPushBackPickup;
  final Function onDeletePickup;

  _ViewModel(
      {this.fetchCount,
      this.error,
      this.subscription,
      this.consumerSubscription,
      this.packages,
      this.pickups,
      this.subscriptionFormState,
      this.pickupState,
      this.onPushBackPickup,
      this.onDeletePickup});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        fetchCount: store.state.subscriptionState.fetchCount,
        error: store.state.subscriptionState.error,
        subscription: store.state.subscriptionState.subscription,
        consumerSubscription: store.state.subscriptionState.consumerSubscription,
        packages: store.state.dataState.packages,
        pickups: store.state.pickupState.pickups,
        subscriptionFormState: store.state.subscriptionFormState,
        pickupState: store.state.pickupState,
        onPushBackPickup: (Pickup pickup) => store.dispatch(PushBackPickupRequest(pickup: pickup)),
        onDeletePickup: (Pickup pickup) => store.dispatch(DeletePickupRequest(pickup: pickup)));
  }
}
