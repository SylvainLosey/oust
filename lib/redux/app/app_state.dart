import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../auth/auth_state.dart';
import '../customer/customer_state.dart';
import '../nav/nav_state.dart';
import '../subscription/subscription_state.dart';
import '../subscription/form/subscription_form_state.dart';
import '../pickup/pickup_state.dart';

part 'app_state.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final AuthState authState;
  final CustomerState customerState;
  final SubscriptionState subscriptionState;
  final SubscriptionFormState subscriptionFormState;
  final PickupState pickupState;
  final NavState navState;

  AppState({
    @required this.authState,
    @required this.customerState,
    @required this.subscriptionState,
    @required this.subscriptionFormState,
    @required this.pickupState,
    @required this.navState,
  });

 factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
  Map<String, dynamic> toJson() => _$AppStateToJson(this);


  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      customerState: CustomerState.initial(),
      subscriptionState: SubscriptionState.initial(),
      subscriptionFormState: SubscriptionFormState.initial(),
      pickupState: PickupState.initial(),
      navState: NavState.initial(),
    );
  }
}