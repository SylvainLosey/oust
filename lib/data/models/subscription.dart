library subscription;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'subscription.g.dart';

abstract class Subscription implements Built<Subscription, SubscriptionBuilder> {
  static Serializer<Subscription> get serializer => _$subscriptionSerializer;

  factory Subscription([updates(SubscriptionBuilder b)]) = _$Subscription;

  Subscription._();

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: 'average_quantity')
  int get averageQuantity;

  @BuiltValueField(wireName: 'base_date')
  @nullable
  DateTime get baseDate;

  @nullable
  String get city;

  @nullable
  int get customer;

  @nullable
  int get id;

  @nullable
  String get name;

  @nullable
  String get note;

  @nullable
  @BuiltValueField(wireName: 'pickup_day')
  int get pickupDay;

  @nullable
  BuiltList<double> get position;

  @nullable
  int get postcode;

  @nullable
  int get remainingPickups;

  @nullable
  String get representation;

  @nullable
  String get status;

  @BuiltValueField(wireName: 'subscription_type')
  @nullable
  String get subscriptionType;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Subscription.serializer, this);
  }

  static Subscription fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Subscription.serializer, jsonString);
  }
}
