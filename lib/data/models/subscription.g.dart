// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
      id: json['id'] as int,
      representation: json['representation'] as String,
      position: (json['position'] as List)
          ?.map((e) => (e as num)?.toDouble())
          ?.toList(),
      postcode: json['postcode'] as int,
      subscriptionType: json['subscription_type'] as String,
      status: json['status'] as String,
      baseDate: json['base_date'] as String,
      remainingPickups: json['remaining_pickups'] as int,
      pickupDay: json['pickup_day'] as int,
      averageQuantity: json['average_quantity'] as int,
      note: json['note'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      customer: json['customer'] as int);
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'representation': instance.representation,
      'position': instance.position,
      'subscription_type': instance.subscriptionType,
      'status': instance.status,
      'base_date': instance.baseDate,
      'remaining_pickups': instance.remainingPickups,
      'pickup_day': instance.pickupDay,
      'average_quantity': instance.averageQuantity,
      'note': instance.note,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'postcode': instance.postcode,
      'customer': instance.customer
    };
