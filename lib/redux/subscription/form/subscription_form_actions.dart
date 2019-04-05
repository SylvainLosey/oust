import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../data/models/subscription_form.dart';

part 'subscription_form_actions.g.dart';

@JsonSerializable()
class SubscriptionFormNextStep {
  Map<String, dynamic> toJson() => _$SubscriptionFormNextStepToJson(this);
}

@JsonSerializable()
class SubscriptionFormPreviousStep {
  Map<String, dynamic> toJson() => _$SubscriptionFormPreviousStepToJson(this);
}
