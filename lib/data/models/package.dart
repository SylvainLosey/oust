library package;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
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

  static Package fromJson(String jsonString) {
    return serializers.deserializeWith(Package.serializer, json.decode(jsonString));
  }

  static Serializer<Package> get serializer => _$packageSerializer;
}



// abstract class Packages implements Built<Packages, PackagesBuilder> {
//   Packages._();

//   factory Packages([updates(PackagesBuilder b)]) = _$Packages;

//   BuiltList<Package> get data;

//   List<Map<String, dynamic>> toJson() {
//     return serializers.serializeWith(Packages.serializer, this);
//   }

//   static Packages fromJson(List<dynamic> jsonString) {
//     return serializers.deserializeWith(Packages.serializer, jsonString);
//   }

//   static Serializer<Packages> get serializer => _$packagesSerializer;
// }