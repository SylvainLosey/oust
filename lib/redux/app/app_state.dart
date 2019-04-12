library AppState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/serializers.dart';
import '../auth/auth_state.dart';
import '../customer/customer_state.dart';
import '../nav/nav_state.dart';
import '../subscription/subscription_state.dart';
import '../subscription/register/subscription_register_state.dart';
import '../pickup/pickup_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AuthState get authState;
  NavState get navState;
  CustomerState get customerState;
  SubscriptionState get subscriptionState;
  SubscriptionRegisterState get subscriptionRegisterState;
  PickupState get pickupState;

  AppState._();

  factory AppState() {
    return _$AppState._(
      authState: AuthState(),
      navState: NavState(),
      customerState:  CustomerState(),
      subscriptionState: SubscriptionState(),
      subscriptionRegisterState: SubscriptionRegisterState(),
      pickupState: PickupState()
    );
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this);
  }

  static AppState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(AppState.serializer, jsonString);
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;
}