library lift_quote_form_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../../data/models/serializers.dart';
import '../../../data/models/lift_quote_form.dart';

part 'lift_quote_form_state.g.dart';

abstract class LiftQuoteFormState implements Built<LiftQuoteFormState, LiftQuoteFormStateBuilder> {
  static Serializer<LiftQuoteFormState> get serializer => _$liftQuoteFormStateSerializer;
  factory LiftQuoteFormState() => _$LiftQuoteFormState((b) => b
    ..isLoading = false
    ..liftQuoteForm = LiftQuoteForm().toBuilder());

  LiftQuoteFormState._();

  @nullable
  String get error;

  @nullable
  bool get isLoading;

  @nullable
  LiftQuoteForm get liftQuoteForm;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftQuoteForm.serializer, this);
  }

  static LiftQuoteFormState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftQuoteFormState.serializer, jsonString);
  }
}
