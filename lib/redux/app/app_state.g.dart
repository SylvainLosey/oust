// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
      authState: json['authState'] == null
          ? null
          : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
      customerState: json['customerState'] == null
          ? null
          : CustomerState.fromJson(
              json['customerState'] as Map<String, dynamic>),
      subscriptionState: json['subscriptionState'] == null
          ? null
          : SubscriptionState.fromJson(
              json['subscriptionState'] as Map<String, dynamic>),
      subscriptionFormState: json['subscriptionFormState'] == null
          ? null
          : SubscriptionFormState.fromJson(
              json['subscriptionFormState'] as Map<String, dynamic>),
      pickupState: json['pickupState'] == null
          ? null
          : PickupState.fromJson(json['pickupState'] as Map<String, dynamic>),
      navState: json['navState'] == null
          ? null
          : NavState.fromJson(json['navState'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'authState': instance.authState,
      'customerState': instance.customerState,
      'subscriptionState': instance.subscriptionState,
      'subscriptionFormState': instance.subscriptionFormState,
      'pickupState': instance.pickupState,
      'navState': instance.navState
    };
