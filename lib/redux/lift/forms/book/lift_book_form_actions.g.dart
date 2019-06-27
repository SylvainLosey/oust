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

LoadLiftSlotsRequest _$LoadLiftSlotsRequestFromJson(Map<String, dynamic> json) {
  return LoadLiftSlotsRequest();
}

Map<String, dynamic> _$LoadLiftSlotsRequestToJson(
        LoadLiftSlotsRequest instance) =>
    <String, dynamic>{};

LoadLiftSlotsSuccess _$LoadLiftSlotsSuccessFromJson(Map<String, dynamic> json) {
  return LoadLiftSlotsSuccess(
      liftSlots: (json['liftSlots'] as List)
          ?.map((e) => e == null ? null : DateTime.parse(e as String))
          ?.toList());
}

Map<String, dynamic> _$LoadLiftSlotsSuccessToJson(
        LoadLiftSlotsSuccess instance) =>
    <String, dynamic>{
      'liftSlots':
          instance.liftSlots?.map((e) => e?.toIso8601String())?.toList()
    };

LoadLiftSlotsFailure _$LoadLiftSlotsFailureFromJson(Map<String, dynamic> json) {
  return LoadLiftSlotsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadLiftSlotsFailureToJson(
        LoadLiftSlotsFailure instance) =>
    <String, dynamic>{'error': instance.error};

SubmitLiftBookFormRequest _$SubmitLiftBookFormRequestFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftBookFormRequest();
}

Map<String, dynamic> _$SubmitLiftBookFormRequestToJson(
        SubmitLiftBookFormRequest instance) =>
    <String, dynamic>{};

SubmitLiftBookFormSuccess _$SubmitLiftBookFormSuccessFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftBookFormSuccess();
}

Map<String, dynamic> _$SubmitLiftBookFormSuccessToJson(
        SubmitLiftBookFormSuccess instance) =>
    <String, dynamic>{};

SubmitLiftBookFormFailure _$SubmitLiftBookFormFailureFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftBookFormFailure(error: json['error'] as String);
}

Map<String, dynamic> _$SubmitLiftBookFormFailureToJson(
        SubmitLiftBookFormFailure instance) =>
    <String, dynamic>{'error': instance.error};
