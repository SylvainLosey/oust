import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../data/models/subscription_form.dart';

part 'subscription_form_actions.g.dart';

@JsonSerializable()
class SubscriptionFormNextStep {
  bool subscriptionIsUnavailable;
  bool customerRequestsAppointment;

  SubscriptionFormNextStep({this.subscriptionIsUnavailable = false, this.customerRequestsAppointment = false});
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


// User for simple data entry - rebuild of model is done directly in the viewmodel
@JsonSerializable()
class UpdateSubscriptionForm {
  @JsonKey(fromJson: SubscriptionForm.fromJson) 
  SubscriptionForm subscriptionForm;

  UpdateSubscriptionForm(this.subscriptionForm);
  Map<String, dynamic> toJson() => _$UpdateSubscriptionFormToJson(this);
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
