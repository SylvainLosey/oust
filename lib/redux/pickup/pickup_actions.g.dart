// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadPickupsRequest _$LoadPickupsRequestFromJson(Map<String, dynamic> json) {
  return LoadPickupsRequest(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(
              json['subscription'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadPickupsRequestToJson(LoadPickupsRequest instance) =>
    <String, dynamic>{'subscription': instance.subscription};

LoadPickupsFailure _$LoadPickupsFailureFromJson(Map<String, dynamic> json) {
  return LoadPickupsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadPickupsFailureToJson(LoadPickupsFailure instance) =>
    <String, dynamic>{'error': instance.error};

UpdatePickupRequest _$UpdatePickupRequestFromJson(Map<String, dynamic> json) {
  return UpdatePickupRequest(
      pickup: json['pickup'] == null
          ? null
          : Pickup.fromJson(json['pickup'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdatePickupRequestToJson(
        UpdatePickupRequest instance) =>
    <String, dynamic>{'pickup': instance.pickup};

UpdatePickupSuccess _$UpdatePickupSuccessFromJson(Map<String, dynamic> json) {
  return UpdatePickupSuccess();
}

Map<String, dynamic> _$UpdatePickupSuccessToJson(
        UpdatePickupSuccess instance) =>
    <String, dynamic>{};

UpdatePickupFailure _$UpdatePickupFailureFromJson(Map<String, dynamic> json) {
  return UpdatePickupFailure(error: json['error'] as String);
}

Map<String, dynamic> _$UpdatePickupFailureToJson(
        UpdatePickupFailure instance) =>
    <String, dynamic>{'error': instance.error};

DeletePickupRequest _$DeletePickupRequestFromJson(Map<String, dynamic> json) {
  return DeletePickupRequest(
      pickup: json['pickup'] == null
          ? null
          : Pickup.fromJson(json['pickup'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DeletePickupRequestToJson(
        DeletePickupRequest instance) =>
    <String, dynamic>{'pickup': instance.pickup};

DeletePickupSuccess _$DeletePickupSuccessFromJson(Map<String, dynamic> json) {
  return DeletePickupSuccess();
}

Map<String, dynamic> _$DeletePickupSuccessToJson(
        DeletePickupSuccess instance) =>
    <String, dynamic>{};

DeletePickupFailure _$DeletePickupFailureFromJson(Map<String, dynamic> json) {
  return DeletePickupFailure(error: json['error'] as String);
}

Map<String, dynamic> _$DeletePickupFailureToJson(
        DeletePickupFailure instance) =>
    <String, dynamic>{'error': instance.error};

PushBackPickupRequest _$PushBackPickupRequestFromJson(
    Map<String, dynamic> json) {
  return PushBackPickupRequest(
      pickup: json['pickup'] == null
          ? null
          : Pickup.fromJson(json['pickup'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PushBackPickupRequestToJson(
        PushBackPickupRequest instance) =>
    <String, dynamic>{'pickup': instance.pickup};

PushBackPickupSuccess _$PushBackPickupSuccessFromJson(
    Map<String, dynamic> json) {
  return PushBackPickupSuccess();
}

Map<String, dynamic> _$PushBackPickupSuccessToJson(
        PushBackPickupSuccess instance) =>
    <String, dynamic>{};

PushBackPickupFailure _$PushBackPickupFailureFromJson(
    Map<String, dynamic> json) {
  return PushBackPickupFailure(error: json['error'] as String);
}

Map<String, dynamic> _$PushBackPickupFailureToJson(
        PushBackPickupFailure instance) =>
    <String, dynamic>{'error': instance.error};
