import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../data/models/subscription_register.dart';

part 'subscription_register_actions.g.dart';

@JsonSerializable()
class SubscriptionRegisterNextStep {
  Map<String, dynamic> toJson() => _$SubscriptionRegisterNextStepToJson(this);
}

@JsonSerializable()
class SubscriptionRegisterPreviousStep {
  Map<String, dynamic> toJson() => _$SubscriptionRegisterPreviousStepToJson(this);
}
