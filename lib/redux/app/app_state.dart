library AppState;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/serializers.dart';
import '../auth/auth_state.dart';
import '../customer/customer_state.dart';
import '../data/data_state.dart';
import '../nav/nav_state.dart';
import '../pickup/pickup_state.dart';
import '../subscription/form/subscription_form_state.dart';
import '../subscription/subscription_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;
  factory AppState() {
    return _$AppState._(
      authState: AuthState(),
      navState: NavState(),
      customerState:  CustomerState(),
      subscriptionState: SubscriptionState(),
      subscriptionFormState: SubscriptionFormState(),
      pickupState: PickupState(),
      dataState: DataState(),
    );
  }
  AppState._();
  AuthState get authState;
  CustomerState get customerState;
  DataState get dataState;
  NavState get navState;

  PickupState get pickupState;

  SubscriptionFormState get subscriptionFormState;

  SubscriptionState get subscriptionState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this);
  }

  static AppState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(AppState.serializer, jsonString);
  }
}