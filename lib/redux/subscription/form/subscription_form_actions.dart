import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../data/models/subscription_form.dart';

part 'subscription_form_actions.g.dart';

@JsonSerializable()
class SubscriptionFormNextStep {
  bool subscriptionIsUnavailable;
  bool customerRequestsAppointment;
  bool doesNotWantContainers;

  SubscriptionFormNextStep(
      {this.subscriptionIsUnavailable = false,
      this.customerRequestsAppointment = false,
      this.doesNotWantContainers = false});
  Map<String, dynamic> toJson() => _$SubscriptionFormNextStepToJson(this);
}

@JsonSerializable()
class SubscriptionFormPreviousStep {
  Map<String, dynamic> toJson() => _$SubscriptionFormPreviousStepToJson(this);
}

@JsonSerializable()
class SubscriptionFormStart {
  Map<String, dynamic> toJson() => _$SubscriptionFormStartToJson(this);
}

@JsonSerializable()
class SubscriptionFormExit {
  Map<String, dynamic> toJson() => _$SubscriptionFormExitToJson(this);
}

// Used for simple data entry - rebuild of model is done directly in the viewmodel
@JsonSerializable()
class UpdateSubscriptionForm {
  @JsonKey(fromJson: SubscriptionForm.fromJson)
  SubscriptionForm subscriptionForm;

  UpdateSubscriptionForm(this.subscriptionForm);
  Map<String, dynamic> toJson() => _$UpdateSubscriptionFormToJson(this);
}

@JsonSerializable()
class PostLeadRequest {
  @JsonKey(fromJson: SubscriptionForm.fromJson)
  SubscriptionForm subscriptionForm;

  PostLeadRequest(this.subscriptionForm);
  Map<String, dynamic> toJson() => _$PostLeadRequestToJson(this);
}

@JsonSerializable()
class PostLeadSuccess {
  PostLeadSuccess();
  Map<String, dynamic> toJson() => _$PostLeadSuccessToJson(this);
}

@JsonSerializable()
class PostLeadFailure {
  String error;

  PostLeadFailure({@required this.error});
  Map<String, dynamic> toJson() => _$PostLeadFailureToJson(this);
}

@JsonSerializable()
class LoadStartDatesRequest {
  final String address;
  final int postcode;
  final int frequency;

  LoadStartDatesRequest({@required this.address, @required this.postcode, @required this.frequency});
  Map<String, dynamic> toJson() => _$LoadStartDatesRequestToJson(this);
}

@JsonSerializable()
class LoadStartDatesSuccess {
  final List<DateTime> startDates;

  LoadStartDatesSuccess({this.startDates});
  Map<String, dynamic> toJson() => _$LoadStartDatesSuccessToJson(this);
}

@JsonSerializable()
class LoadStartDatesFailure {
  final String error;

  LoadStartDatesFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadStartDatesFailureToJson(this);
}

@JsonSerializable()
class IncrementProductQuantity {
  String product;

  IncrementProductQuantity({this.product});
  Map<String, dynamic> toJson() => _$IncrementProductQuantityToJson(this);
}

@JsonSerializable()
class DecrementProductQuantity {
  String product;

  DecrementProductQuantity({this.product});
  Map<String, dynamic> toJson() => _$DecrementProductQuantityToJson(this);
}

// SUBMIT FORM
@JsonSerializable()
class SubmitSubscriptionFormRequest {
  Map<String, dynamic> toJson() => _$SubmitSubscriptionFormRequestToJson(this);
}

@JsonSerializable()
class SubmitSubscriptionFormSuccess {
  Map<String, dynamic> toJson() => _$SubmitSubscriptionFormSuccessToJson(this);
}

@JsonSerializable()
class SubmitSubscriptionFormFailure {
  final String error;

  SubmitSubscriptionFormFailure({this.error});
  Map<String, dynamic> toJson() => _$SubmitSubscriptionFormFailureToJson(this);
}

@JsonSerializable()
class SubscriptionFormReset {
  Map<String, dynamic> toJson() => _$SubscriptionFormResetToJson(this);
}
