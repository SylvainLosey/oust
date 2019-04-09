// import 'package:json_annotation/json_annotation.dart';

// part 'subscription.g.dart';

// @JsonSerializable()
// class Subscription {
//     int id;
//     String representation;
//     List<double> position;
//     @JsonKey(name: 'subscription_type')
//     String subscriptionType;
//     String status;
//     @JsonKey(name: 'base_date')
//     String baseDate;
//     @JsonKey(name: 'remaining_pickups')
//     int remainingPickups;
//     @JsonKey(name: 'pickup_day')
//     int pickupDay;
//     @JsonKey(name: 'average_quantity')
//     int averageQuantity;
//     String note;
//     String name;
//     String address;
//     String city;
//     int postcode;
//     int customer;

//     Subscription({
//         this.id,
//         this.representation,
//         this.position,
//         this.postcode,
//         this.subscriptionType,
//         this.status,
//         this.baseDate,
//         this.remainingPickups,
//         this.pickupDay,
//         this.averageQuantity,
//         this.note,
//         this.name,
//         this.address,
//         this.city,
//         this.customer,
//     });

//     factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
//     Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
// }



library subscription;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'subscription.g.dart';

abstract class Subscription implements Built<Subscription, SubscriptionBuilder> {
  Subscription._();

  factory Subscription([updates(SubscriptionBuilder b)]) = _$Subscription;

  int get id;
  String get representation;
  @nullable
  BuiltList<double> get position;
  @nullable
  @BuiltValueField(wireName: 'subscription_type')
  @nullable
  String get subscriptionType;
  @nullable
  String get status;
  @BuiltValueField(wireName: 'base_date')
  @nullable
  String get baseDate;
  @nullable
  int get remainingPickups;
  @nullable
  @BuiltValueField(wireName: 'pickup_day')
  int get pickupDay;
  @nullable
  @BuiltValueField(wireName: 'average_quantity')
  int get averageQuantity;
  @nullable
  String get note;
  @nullable
  String get name;
  @nullable
  String get address;
  @nullable
  String get city;
  @nullable
  int get customer;
  @nullable
  int get postcode;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Subscription.serializer, this);
  }

  static Subscription fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Subscription.serializer, jsonString);
  }

  static Serializer<Subscription> get serializer => _$subscriptionSerializer;
}
