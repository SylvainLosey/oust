library pickup_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/pickup.dart';
import '../../data/models/serializers.dart';

part 'pickup_state.g.dart';

abstract class PickupState implements Built<PickupState, PickupStateBuilder> {
  static Serializer<PickupState> get serializer => _$pickupStateSerializer;
  factory PickupState() => _$PickupState((PickupStateBuilder b) => b
    ..isLoading = false
  );
  PickupState._();

  @nullable
  String get error;

  bool get isLoading;

  @nullable
  BuiltMap<int, Pickup> get pickups;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PickupState.serializer, this);
  }

  static PickupState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(PickupState.serializer, jsonString);
  }
}