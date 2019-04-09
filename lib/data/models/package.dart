library package;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'package.g.dart';

abstract class Package implements Built<Package, PackageBuilder> {
  Package._();

  factory Package([updates(PackageBuilder b)]) = _$Package;

  int get id;
  String get name;
  String get length;
  @BuiltValueField(wireName: 'frequency_weeks')
  int get frequencyWeeks;
  int get pickups;
  @BuiltValueField(wireName: 'unit_price')
  String get unitPrice;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Package.serializer, this);
  }

  static Package fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Package.serializer, jsonString);
  }

  static Serializer<Package> get serializer => _$packageSerializer;
}

