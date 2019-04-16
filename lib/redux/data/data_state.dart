library data_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/postcode.dart';
import '../../data/models/serializers.dart';

part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {
  bool get isLoading;
  @nullable
  BuiltMap<int, Postcode> get postcodes;
  @nullable
  String get error;

  DataState._();

  factory DataState([void Function(DataStateBuilder) updates]) => _$DataState((b) => b
    ..isLoading = false
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DataState.serializer, this);
  }

  static DataState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(DataState.serializer, jsonString);
  }

  static Serializer<DataState> get serializer => _$dataStateSerializer;
}