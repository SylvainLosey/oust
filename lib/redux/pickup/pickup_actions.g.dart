// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadPickupsRequest _$LoadPickupsRequestFromJson(Map<String, dynamic> json) {
  return LoadPickupsRequest(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as List));
}

Map<String, dynamic> _$LoadPickupsRequestToJson(LoadPickupsRequest instance) =>
    <String, dynamic>{'subscription': instance.subscription};

LoadPickupsSuccess _$LoadPickupsSuccessFromJson(Map<String, dynamic> json) {
  return LoadPickupsSuccess(
      pickups: (json['pickups'] as List)
          ?.map((e) =>
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
