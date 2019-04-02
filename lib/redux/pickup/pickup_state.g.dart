// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupState _$PickupStateFromJson(Map<String, dynamic> json) {
  return PickupState(
      isLoading: json['isLoading'] as bool,
      pickups: (json['pickups'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k, e == null ? null : Pickup.fromJson(e as Map<String, dynamic>)),
      ),
      error: json['error'] as String);
}

Map<String, dynamic> _$PickupStateToJson(PickupState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'pickups': instance.pickups,
      'error': instance.error
    };
