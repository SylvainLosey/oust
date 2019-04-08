// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) {
  return Package(
      id: json['id'] as int,
      name: json['name'] as String,
      length: json['length'] as String,
      frequencyWeeks: json['frequency_weeks'] as int,
      pickups: json['pickups'] as int,
      unitPrice: json['unit_price'] as String);
}

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'length': instance.length,
      'frequency_weeks': instance.frequencyWeeks,
      'pickups': instance.pickups,
      'unit_price': instance.unitPrice
    };
