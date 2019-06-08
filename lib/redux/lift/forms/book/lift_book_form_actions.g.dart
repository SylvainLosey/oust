// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_book_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiftBookFormNextStep _$LiftBookFormNextStepFromJson(Map<String, dynamic> json) {
  return LiftBookFormNextStep();
}

Map<String, dynamic> _$LiftBookFormNextStepToJson(
        LiftBookFormNextStep instance) =>
    <String, dynamic>{};

LiftBookFormPreviousStep _$LiftBookFormPreviousStepFromJson(
    Map<String, dynamic> json) {
  return LiftBookFormPreviousStep();
}

Map<String, dynamic> _$LiftBookFormPreviousStepToJson(
        LiftBookFormPreviousStep instance) =>
    <String, dynamic>{};

LiftBookFormStart _$LiftBookFormStartFromJson(Map<String, dynamic> json) {
  return LiftBookFormStart();
}

Map<String, dynamic> _$LiftBookFormStartToJson(LiftBookFormStart instance) =>
    <String, dynamic>{};

LiftBookFormExit _$LiftBookFormExitFromJson(Map<String, dynamic> json) {
  return LiftBookFormExit();
}

Map<String, dynamic> _$LiftBookFormExitToJson(LiftBookFormExit instance) =>
    <String, dynamic>{};

UpdateLiftBookForm _$UpdateLiftBookFormFromJson(Map<String, dynamic> json) {
  return UpdateLiftBookForm(json['liftBookForm'] == null
      ? null
      : LiftBookForm.fromJson(json['liftBookForm'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateLiftBookFormToJson(UpdateLiftBookForm instance) =>
    <String, dynamic>{'liftBookForm': instance.liftBookForm};
