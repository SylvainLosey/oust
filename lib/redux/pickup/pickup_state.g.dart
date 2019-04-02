// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupState _$PickupStateFromJson(Map<String, dynamic> json) {
  return PickupState(
      isLoading: json['isLoading'] as bool,
      pickups: (json['pickups'] as List)
          ?.map((e) =>
              e == null ? null : Pickup.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      error: json['error'] as String);
}

Map<String, dynamic> _$PickupStateToJson(PickupState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'pickups': instance.pickups,
      'error': instance.error
    };
