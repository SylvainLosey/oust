library Pickup;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'pickup.g.dart';

abstract class Pickup implements Built<Pickup, PickupBuilder> {
  int get id;
  @nullable
  String get representation;
  @nullable
  String get city;
  @nullable
  BuiltList<double> get position;
  @nullable
  @BuiltValueField(wireName: 'average_duration')
  @nullable
  int get averageDuration;
  @BuiltValueField(wireName: 'average_quantity')
  @nullable
  int get averageQuantity;
  @BuiltValueField(wireName: 'pickup_date')
  @nullable
  String get pickupDate;
  @nullable
  String get duration;
  @nullable
  bool get completed;
  @nullable
  @BuiltValueField(wireName: 'completed_at')
  String get completedAt;
  @nullable
  @BuiltValueField(wireName: 'customer_unavailable')
  bool get customerUnavailable;
  @nullable
  String get note;
  int get subscription;

  Pickup._();

  factory Pickup([void Function(PickupBuilder) updates]) = _$Pickup;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pickup.serializer, this);
  }

  static Pickup fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Pickup.serializer, jsonString);
  }

  static Serializer<Pickup> get serializer => _$pickupSerializer;
}