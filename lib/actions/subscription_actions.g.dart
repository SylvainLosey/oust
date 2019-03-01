// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadSubscriptionAction _$LoadSubscriptionActionFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionAction(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadSubscriptionActionToJson(
        LoadSubscriptionAction instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadSubscriptionSuccess _$LoadSubscriptionSuccessFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionSuccess(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as List));
}

Map<String, dynamic> _$LoadSubscriptionSuccessToJson(
        LoadSubscriptionSuccess instance) =>
    <String, dynamic>{'subscription': instance.subscription};

LoadSubscriptionFailure _$LoadSubscriptionFailureFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadSubscriptionFailureToJson(
        LoadSubscriptionFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadPickupsAction _$LoadPickupsActionFromJson(Map<String, dynamic> json) {
  return LoadPickupsAction(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as List));
}

Map<String, dynamic> _$LoadPickupsActionToJson(LoadPickupsAction instance) =>
    <String, dynamic>{'subscription': instance.subscription};

LoadPickupsSuccess _$LoadPickupsSuccessFromJson(Map<String, dynamic> json) {
  return LoadPickupsSuccess(
      pickups: (json['pickups'] as List)
          ?.map((dynamic e) =>
              e == null ? null : Pickup.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LoadPickupsSuccessToJson(LoadPickupsSuccess instance) =>
    <String, dynamic>{'pickups': instance.pickups};

LoadPickupsFailure _$LoadPickupsFailureFromJson(Map<String, dynamic> json) {
  return LoadPickupsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadPickupsFailureToJson(LoadPickupsFailure instance) =>
    <String, dynamic>{'error': instance.error};
