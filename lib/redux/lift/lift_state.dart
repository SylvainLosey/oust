library lift_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/serializers.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
import '../../data/models/lift_event.dart';
import 'forms/quote/lift_quote_form_state.dart';

part 'lift_state.g.dart';

abstract class LiftState implements Built<LiftState, LiftStateBuilder> {
  @nullable
  int get fetchCount;

  @nullable
  String get error;

  @nullable
  int get selectedId;

  @nullable
  BuiltMap<int, Lift> get lifts;

  @nullable
  BuiltMap<int, LiftImage> get liftImages;

  @nullable
  BuiltMap<int, LiftEvent> get liftEvents;

  LiftState._();

  factory LiftState() {
    return _$LiftState._(fetchCount: 0);
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftState.serializer, this);
  }

  static LiftState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftState.serializer, jsonString);
  }

  static Serializer<LiftState> get serializer => _$liftStateSerializer;
}
