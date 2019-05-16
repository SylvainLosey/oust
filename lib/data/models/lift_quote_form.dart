library lift_quote_form;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'lift_image.dart';
import 'serializers.dart';

part 'lift_quote_form.g.dart';

abstract class LiftQuoteForm implements Built<LiftQuoteForm, LiftQuoteFormBuilder> {
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
  bool get note;

  LiftQuoteForm._();

  factory LiftQuoteForm([void Function(LiftQuoteFormBuilder) updates]) = _$LiftQuoteForm;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftQuoteForm.serializer, this);
  }

  static LiftQuoteForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftQuoteForm.serializer, jsonString);
  }

  static Serializer<LiftQuoteForm> get serializer => _$liftQuoteFormSerializer;
}
