library postcode;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'postcode.g.dart';

abstract class Postcode implements Built<Postcode, PostcodeBuilder> {
  int get id;
  String get postcode;
  String get country;
  String get name;
  @BuiltValueField(wireName: 'subscription_available')
  bool get subscriptionAvailable;
  @BuiltValueField(wireName: 'lift_available')
  bool get liftAvailable;
  @nullable
  int get state;

  Postcode._();

  factory Postcode([updates(PostcodeBuilder b)]) = _$Postcode;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Postcode.serializer, this);
  }

  static Postcode fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Postcode.serializer, jsonString);
  }

  static Serializer<Postcode> get serializer => _$postcodeSerializer;
}
