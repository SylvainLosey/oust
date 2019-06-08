library lift_book_form_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../../../data/models/serializers.dart';
import '../../../../data/models/lift_book_form.dart';

part 'lift_book_form_state.g.dart';

abstract class LiftBookFormState implements Built<LiftBookFormState, LiftBookFormStateBuilder> {
  static Serializer<LiftBookFormState> get serializer => _$liftBookFormStateSerializer;
  factory LiftBookFormState() => _$LiftBookFormState((b) => b
    ..isLoading = false
    ..liftBookForm = LiftBookForm().toBuilder());

  LiftBookFormState._();

  @nullable
  String get error;

  @nullable
  bool get isLoading;

  @nullable
  LiftBookForm get liftBookForm;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftBookForm.serializer, this);
  }

  static LiftBookFormState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftBookFormState.serializer, jsonString);
  }
}
