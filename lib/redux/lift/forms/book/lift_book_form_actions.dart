import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/lift_book_form.dart';

part 'lift_book_form_actions.g.dart';

@JsonSerializable()
class LiftBookFormNextStep {
  Map<String, dynamic> toJson() => _$LiftBookFormNextStepToJson(this);
}

@JsonSerializable()
class LiftBookFormPreviousStep {
  Map<String, dynamic> toJson() => _$LiftBookFormPreviousStepToJson(this);
}

@JsonSerializable()
class LiftBookFormStart {
  Map<String, dynamic> toJson() => _$LiftBookFormStartToJson(this);
}

@JsonSerializable()
class LiftBookFormExit {
  Map<String, dynamic> toJson() => _$LiftBookFormExitToJson(this);
}

// Used for simple data entry - rebuild of model is done directly in the viewmodel
@JsonSerializable()
class UpdateLiftBookForm {
  @JsonKey(fromJson: LiftBookForm.fromJson)
  LiftBookForm liftBookForm;

  UpdateLiftBookForm(this.liftBookForm);
  Map<String, dynamic> toJson() => _$UpdateLiftBookFormToJson(this);
}

@JsonSerializable()
class LoadLiftSlotsRequest {
  Map<String, dynamic> toJson() => _$LoadLiftSlotsRequestToJson(this);
}

@JsonSerializable()
class LoadLiftSlotsSuccess {
  final List<DateTime> liftSlots;

  LoadLiftSlotsSuccess({this.liftSlots});
  Map<String, dynamic> toJson() => _$LoadLiftSlotsSuccessToJson(this);
}

@JsonSerializable()
class LoadLiftSlotsFailure {
  final String error;

  LoadLiftSlotsFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadLiftSlotsFailureToJson(this);
}

// SUBMIT FORM
@JsonSerializable()
class SubmitLiftBookFormRequest {
  Map<String, dynamic> toJson() => _$SubmitLiftBookFormRequestToJson(this);
}

@JsonSerializable()
class SubmitLiftBookFormSuccess {
  Map<String, dynamic> toJson() => _$SubmitLiftBookFormSuccessToJson(this);
}

@JsonSerializable()
class SubmitLiftBookFormFailure {
  final String error;

  SubmitLiftBookFormFailure({this.error});
  Map<String, dynamic> toJson() => _$SubmitLiftBookFormFailureToJson(this);
}
