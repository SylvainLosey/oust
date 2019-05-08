library data_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/postcode.dart';
import '../../data/models/serializers.dart';
import '../../data/models/package.dart';


part 'data_state.g.dart';

abstract class DataState implements Built<DataState, DataStateBuilder> {
  static Serializer<DataState> get serializer => _$dataStateSerializer;
  factory DataState() => _$DataState((DataStateBuilder b) => b
    ..fetchCount = 0
  );
  DataState._();

  @nullable
  String get error;

  int get fetchCount;

  @nullable
  BuiltMap<int, Package> get packages;

  @nullable
  @BuiltValueField(serialize: false)
  BuiltMap<int, Postcode> get postcodes;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DataState.serializer, this);
  }

  static DataState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(DataState.serializer, jsonString);
  }
}