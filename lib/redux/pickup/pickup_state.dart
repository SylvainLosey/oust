library pickup_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/pickup.dart';
import '../../data/models/serializers.dart';

part 'pickup_state.g.dart';

abstract class PickupState implements Built<PickupState, PickupStateBuilder> {
  bool get isLoading;
  @nullable
  BuiltMap<int, Pickup> get pickups;
  @nullable
  String get error;

  PickupState._();

  factory PickupState([void Function(PickupStateBuilder) updates]) => _$PickupState((b) => b
    ..isLoading = false
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PickupState.serializer, this);
  }

  static PickupState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(PickupState.serializer, jsonString);
  }

  static Serializer<PickupState> get serializer => _$pickupStateSerializer;
}