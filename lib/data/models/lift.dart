library lift;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';

import 'serializers.dart';

part 'lift.g.dart';

abstract class Lift implements Built<Lift, LiftBuilder> {
  @nullable
  int get id;

  @nullable
  int get customer;

  @nullable
  String get status;

  @nullable
  String get address;

  @nullable
  int get postcode;

  @nullable
  BuiltList<double> get position;

  @nullable
  int get floor;

  @nullable
  bool get elevator;

  @nullable
  String get note;

  @nullable
  @BuiltValueField(wireName: 'customer_note')
  String get customerNote;

  @nullable
  @BuiltValueField(wireName: 'estimated_employees')
  int get estimatedEmployees;

  @nullable
  @BuiltValueField(wireName: 'estimated_duration')
  int get estimatedDuration;

  @nullable
  @BuiltValueField(wireName: 'estimated_price')
  Decimal get estimatedPrice;

  @nullable
  bool get flexible;

  @nullable
  @BuiltValueField(wireName: 'rounds_compatible')
  bool get roundsCompatible;

  @nullable
  DateTime get created;

  Lift._();

  factory Lift([void Function(LiftBuilder) updates]) = _$Lift;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Lift.serializer, this);
  }

  static Lift fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Lift.serializer, jsonString);
  }

  static Serializer<Lift> get serializer => _$liftSerializer;
}
