import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'auth_state.dart';
import 'customer_state.dart';
import 'nav_state.dart';
import 'subscription_state.dart';

part 'app_state.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final AuthState authState;
  final CustomerState customerState;
  final SubscriptionState subscriptionState;
  final NavState navState;

  AppState({
    @required this.authState,
    @required this.customerState,
    @required this.subscriptionState,
    @required this.navState,
  });

 factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
  Map<String, dynamic> toJson() => _$AppStateToJson(this);


  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      customerState: CustomerState.initial(),
      subscriptionState: SubscriptionState.initial(),
      navState: NavState.initial(),
    );
  }
}