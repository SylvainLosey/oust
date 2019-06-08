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