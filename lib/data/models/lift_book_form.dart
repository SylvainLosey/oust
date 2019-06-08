library lift_book_form;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'lift_book_form.g.dart';

abstract class LiftBookForm implements Built<LiftBookForm, LiftBookFormBuilder> {
  factory LiftBookForm() => _$LiftBookForm((LiftBookFormBuilder b) => b..currentStep = 0);

  @nullable
  int get currentStep;

  @nullable
  bool get noCustomerRequired;

  @nullable
  BuiltList<DateTime> get liftSlots;

  @nullable
  DateTime get selectedLiftSlot;

  LiftBookForm._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftBookForm.serializer, this);
  }

  static LiftBookForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftBookForm.serializer, jsonString);
  }

  static Serializer<LiftBookForm> get serializer => _$liftBookFormSerializer;
}
