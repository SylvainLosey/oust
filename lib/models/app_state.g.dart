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
      navState: json['navState'] == null
          ? null
          : NavState.fromJson(json['navState'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'authState': instance.authState,
      'customerState': instance.customerState,
      'subscriptionState': instance.subscriptionState,
      'navState': instance.navState
    };
