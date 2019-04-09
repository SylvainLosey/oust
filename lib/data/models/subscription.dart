library subscription;

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
