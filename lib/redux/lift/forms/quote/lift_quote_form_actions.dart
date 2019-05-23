import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../../data/models/lift_quote_form.dart';
import '../../../../data/models/lift_image.dart';

part 'lift_quote_form_actions.g.dart';

@JsonSerializable()
class LiftQuoteFormNextStep {
  bool liftIsUnavailable;

  LiftQuoteFormNextStep({this.liftIsUnavailable = false});
  Map<String, dynamic> toJson() => _$LiftQuoteFormNextStepToJson(this);
}

@JsonSerializable()
class LiftQuoteFormPreviousStep {
  Map<String, dynamic> toJson() => _$LiftQuoteFormPreviousStepToJson(this);
}

@JsonSerializable()
class LiftQuoteFormStart {
  Map<String, dynamic> toJson() => _$LiftQuoteFormStartToJson(this);
}

@JsonSerializable()
class LiftQuoteFormExit {
  Map<String, dynamic> toJson() => _$LiftQuoteFormExitToJson(this);
}

// Used for simple data entry - rebuild of model is done directly in the viewmodel
@JsonSerializable()
class UpdateLiftQuoteForm {
  @JsonKey(fromJson: LiftQuoteForm.fromJson)
  LiftQuoteForm liftQuoteForm;

  UpdateLiftQuoteForm(this.liftQuoteForm);
  Map<String, dynamic> toJson() => _$UpdateLiftQuoteFormToJson(this);
}

@JsonSerializable()
class AddLiftImage {
  @JsonKey(ignore: true)
  Asset image;
  String uuid;

  AddLiftImage({this.image, @required this.uuid});
  Map<String, dynamic> toJson() => _$AddLiftImageToJson(this);
}

@JsonSerializable()
class AddLiftImageSuccess {
  String uuid;
  String url;

  AddLiftImageSuccess({@required this.uuid, @required this.url});
  Map<String, dynamic> toJson() => _$AddLiftImageSuccessToJson(this);
}

@JsonSerializable()
class AddLiftImageFailure {
  String error;

  AddLiftImageFailure({@required this.error});
  Map<String, dynamic> toJson() => _$AddLiftImageFailureToJson(this);
}

@JsonSerializable()
class DeleteLiftImage {
  @JsonKey(fromJson: LiftImage.fromJson)
  LiftImage image;

  DeleteLiftImage({@required this.image});
  Map<String, dynamic> toJson() => _$DeleteLiftImageToJson(this);
}

@JsonSerializable()
class DeleteLiftImageSuccess {
  Map<String, dynamic> toJson() => _$DeleteLiftImageSuccessToJson(this);
}

@JsonSerializable()
class DeleteLiftImageFailure {
  String error;

  DeleteLiftImageFailure({@required this.error});
  Map<String, dynamic> toJson() => _$DeleteLiftImageFailureToJson(this);
}

@JsonSerializable()
class LiftQuoteFormIncrementFloor {
  Map<String, dynamic> toJson() => _$LiftQuoteFormIncrementFloorToJson(this);
}

@JsonSerializable()
class LiftQuoteFormDecrementFloor {
  Map<String, dynamic> toJson() => _$LiftQuoteFormDecrementFloorToJson(this);
}

@JsonSerializable()
class LiftQuoteFormToggleElevator {
  Map<String, dynamic> toJson() => _$LiftQuoteFormToggleElevatorToJson(this);
}

@JsonSerializable()
class PostLiftLeadRequest {
  @JsonKey(fromJson: LiftQuoteForm.fromJson)
  LiftQuoteForm liftForm;

  PostLiftLeadRequest(this.liftForm);
  Map<String, dynamic> toJson() => _$PostLiftLeadRequestToJson(this);
}

@JsonSerializable()
class PostLiftLeadSuccess {
  PostLiftLeadSuccess();
  Map<String, dynamic> toJson() => _$PostLiftLeadSuccessToJson(this);
}

@JsonSerializable()
class PostLiftLeadFailure {
  String error;

  PostLiftLeadFailure({@required this.error});
  Map<String, dynamic> toJson() => _$PostLiftLeadFailureToJson(this);
}

// SUBMIT FORM
@JsonSerializable()
class SubmitLiftQuoteFormRequest {
  Map<String, dynamic> toJson() => _$SubmitLiftQuoteFormRequestToJson(this);
}

@JsonSerializable()
class SubmitLiftQuoteFormSuccess {
  Map<String, dynamic> toJson() => _$SubmitLiftQuoteFormSuccessToJson(this);
}

@JsonSerializable()
class SubmitLiftQuoteFormFailure {
  final String error;

  SubmitLiftQuoteFormFailure({this.error});
  Map<String, dynamic> toJson() => _$SubmitLiftQuoteFormFailureToJson(this);
}

// @JsonSerializable()
// class LiftQuoteFormReset {
//   Map<String, dynamic> toJson() => _$LiftQuoteFormResetToJson(this);
// }
