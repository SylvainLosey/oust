// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_quote_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiftQuoteFormNextStep _$LiftQuoteFormNextStepFromJson(
    Map<String, dynamic> json) {
  return LiftQuoteFormNextStep(
      liftIsUnavailable: json['liftIsUnavailable'] as bool);
}

Map<String, dynamic> _$LiftQuoteFormNextStepToJson(
        LiftQuoteFormNextStep instance) =>
    <String, dynamic>{'liftIsUnavailable': instance.liftIsUnavailable};

LiftQuoteFormPreviousStep _$LiftQuoteFormPreviousStepFromJson(
    Map<String, dynamic> json) {
  return LiftQuoteFormPreviousStep();
}

Map<String, dynamic> _$LiftQuoteFormPreviousStepToJson(
        LiftQuoteFormPreviousStep instance) =>
    <String, dynamic>{};

LiftQuoteFormStart _$LiftQuoteFormStartFromJson(Map<String, dynamic> json) {
  return LiftQuoteFormStart();
}

Map<String, dynamic> _$LiftQuoteFormStartToJson(LiftQuoteFormStart instance) =>
    <String, dynamic>{};

LiftQuoteFormExit _$LiftQuoteFormExitFromJson(Map<String, dynamic> json) {
  return LiftQuoteFormExit();
}

Map<String, dynamic> _$LiftQuoteFormExitToJson(LiftQuoteFormExit instance) =>
    <String, dynamic>{};

UpdateLiftQuoteForm _$UpdateLiftQuoteFormFromJson(Map<String, dynamic> json) {
  return UpdateLiftQuoteForm(json['liftQuoteForm'] == null
      ? null
      : LiftQuoteForm.fromJson(json['liftQuoteForm'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateLiftQuoteFormToJson(
        UpdateLiftQuoteForm instance) =>
    <String, dynamic>{'liftQuoteForm': instance.liftQuoteForm};

AddLiftImage _$AddLiftImageFromJson(Map<String, dynamic> json) {
  return AddLiftImage(uuid: json['uuid'] as String);
}

Map<String, dynamic> _$AddLiftImageToJson(AddLiftImage instance) =>
    <String, dynamic>{'uuid': instance.uuid};

AddLiftImageSuccess _$AddLiftImageSuccessFromJson(Map<String, dynamic> json) {
  return AddLiftImageSuccess(
      uuid: json['uuid'] as String, url: json['url'] as String);
}

Map<String, dynamic> _$AddLiftImageSuccessToJson(
        AddLiftImageSuccess instance) =>
    <String, dynamic>{'uuid': instance.uuid, 'url': instance.url};

AddLiftImageFailure _$AddLiftImageFailureFromJson(Map<String, dynamic> json) {
  return AddLiftImageFailure(error: json['error'] as String);
}

Map<String, dynamic> _$AddLiftImageFailureToJson(
        AddLiftImageFailure instance) =>
    <String, dynamic>{'error': instance.error};

DeleteLiftImage _$DeleteLiftImageFromJson(Map<String, dynamic> json) {
  return DeleteLiftImage(
      image: json['image'] == null
          ? null
          : LiftImage.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DeleteLiftImageToJson(DeleteLiftImage instance) =>
    <String, dynamic>{'image': instance.image};

DeleteLiftImageSuccess _$DeleteLiftImageSuccessFromJson(
    Map<String, dynamic> json) {
  return DeleteLiftImageSuccess();
}

Map<String, dynamic> _$DeleteLiftImageSuccessToJson(
        DeleteLiftImageSuccess instance) =>
    <String, dynamic>{};

DeleteLiftImageFailure _$DeleteLiftImageFailureFromJson(
    Map<String, dynamic> json) {
  return DeleteLiftImageFailure(error: json['error'] as String);
}

Map<String, dynamic> _$DeleteLiftImageFailureToJson(
        DeleteLiftImageFailure instance) =>
    <String, dynamic>{'error': instance.error};

LiftQuoteFormIncrementFloor _$LiftQuoteFormIncrementFloorFromJson(
    Map<String, dynamic> json) {
  return LiftQuoteFormIncrementFloor();
}

Map<String, dynamic> _$LiftQuoteFormIncrementFloorToJson(
        LiftQuoteFormIncrementFloor instance) =>
    <String, dynamic>{};

LiftQuoteFormDecrementFloor _$LiftQuoteFormDecrementFloorFromJson(
    Map<String, dynamic> json) {
  return LiftQuoteFormDecrementFloor();
}

Map<String, dynamic> _$LiftQuoteFormDecrementFloorToJson(
        LiftQuoteFormDecrementFloor instance) =>
    <String, dynamic>{};

LiftQuoteFormToggleElevator _$LiftQuoteFormToggleElevatorFromJson(
    Map<String, dynamic> json) {
  return LiftQuoteFormToggleElevator();
}

Map<String, dynamic> _$LiftQuoteFormToggleElevatorToJson(
        LiftQuoteFormToggleElevator instance) =>
    <String, dynamic>{};

PostLiftLeadRequest _$PostLiftLeadRequestFromJson(Map<String, dynamic> json) {
  return PostLiftLeadRequest(json['liftForm'] == null
      ? null
      : LiftQuoteForm.fromJson(json['liftForm'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PostLiftLeadRequestToJson(
        PostLiftLeadRequest instance) =>
    <String, dynamic>{'liftForm': instance.liftForm};

PostLiftLeadSuccess _$PostLiftLeadSuccessFromJson(Map<String, dynamic> json) {
  return PostLiftLeadSuccess();
}

Map<String, dynamic> _$PostLiftLeadSuccessToJson(
        PostLiftLeadSuccess instance) =>
    <String, dynamic>{};

PostLiftLeadFailure _$PostLiftLeadFailureFromJson(Map<String, dynamic> json) {
  return PostLiftLeadFailure(error: json['error'] as String);
}

Map<String, dynamic> _$PostLiftLeadFailureToJson(
        PostLiftLeadFailure instance) =>
    <String, dynamic>{'error': instance.error};

SubmitLiftQuoteFormRequest _$SubmitLiftQuoteFormRequestFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftQuoteFormRequest();
}

Map<String, dynamic> _$SubmitLiftQuoteFormRequestToJson(
        SubmitLiftQuoteFormRequest instance) =>
    <String, dynamic>{};

SubmitLiftQuoteFormSuccess _$SubmitLiftQuoteFormSuccessFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftQuoteFormSuccess();
}

Map<String, dynamic> _$SubmitLiftQuoteFormSuccessToJson(
        SubmitLiftQuoteFormSuccess instance) =>
    <String, dynamic>{};

SubmitLiftQuoteFormFailure _$SubmitLiftQuoteFormFailureFromJson(
    Map<String, dynamic> json) {
  return SubmitLiftQuoteFormFailure(error: json['error'] as String);
}

Map<String, dynamic> _$SubmitLiftQuoteFormFailureToJson(
        SubmitLiftQuoteFormFailure instance) =>
    <String, dynamic>{'error': instance.error};
