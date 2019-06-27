library lift_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'lift_event.g.dart';

abstract class LiftEvent implements Built<LiftEvent, LiftEventBuilder> {
  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'flexible')
  bool get flexible;

  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: 'start')
  String get start;

  @nullable
  @BuiltValueField(wireName: 'end')
  String get end;

  @nullable
  @BuiltValueField(wireName: 'event_id')
  String get eventId;

  @nullable
  @BuiltValueField(wireName: 'lift')
  int get lift;

  LiftEvent._();

  factory LiftEvent([void Function(LiftEventBuilder) updates]) = _$LiftEvent;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftEvent.serializer, this);
  }

  static LiftEvent fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftEvent.serializer, jsonString);
  }

  static Serializer<LiftEvent> get serializer => _$liftEventSerializer;
}
