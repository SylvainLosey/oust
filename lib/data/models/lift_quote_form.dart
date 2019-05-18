library lift_quote_form;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'lift_image.dart';
import 'serializers.dart';

part 'lift_quote_form.g.dart';

abstract class LiftQuoteForm implements Built<LiftQuoteForm, LiftQuoteFormBuilder> {
  factory LiftQuoteForm() => _$LiftQuoteForm((LiftQuoteFormBuilder b) => b
    ..currentStep = 0
    ..floor = 0
    ..elevator = false);

  @nullable
  int get currentStep;

  @nullable
  BuiltMap<String, LiftImage> get images;

  @nullable
  bool get noCustomerRequired;

  @nullable
  String get firstName;

  @nullable
  String get lastName;

  @nullable
  String get address;

  @nullable
  int get postcode;

  @nullable
  int get floor;

  @nullable
  bool get elevator;

  @nullable
  String get note;

  LiftQuoteForm._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftQuoteForm.serializer, this);
  }

  static LiftQuoteForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftQuoteForm.serializer, jsonString);
  }

  static Serializer<LiftQuoteForm> get serializer => _$liftQuoteFormSerializer;
}
