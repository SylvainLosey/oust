// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pickup _$PickupFromJson(Map<String, dynamic> json) {
  return Pickup(
      id: json['id'] as int,
      representation: json['representation'] as String,
      city: json['city'] as String,
      position: (json['position'] as List)
          ?.map((e) => (e as num)?.toDouble())
          ?.toList(),
      averageDuration: json['customer_duration'] as int,
      averageQuantity: json['customer_quantity'] as int,
      pickupDate: json['pickup_date'] == null
          ? null
          : DateTime.parse(json['pickup_date'] as String),
      duration: json['duration'],
      completed: json['completed'] as bool,
      customerUnavailable: json['customer_unvavailable'] as bool,
      note: json['note'] as String,
      subscription: json['subscription'] as int);
}

Map<String, dynamic> _$PickupToJson(Pickup instance) => <String, dynamic>{
      'id': instance.id,
      'representation': instance.representation,
      'city': instance.city,
      'position': instance.position,
      'customer_duration': instance.averageDuration,
      'customer_quantity': instance.averageQuantity,
      'pickup_date': instance.pickupDate?.toIso8601String(),
      'duration': instance.duration,
      'completed': instance.completed,
      'customer_unvavailable': instance.customerUnavailable,
      'note': instance.note,
      'subscription': instance.subscription
    };
