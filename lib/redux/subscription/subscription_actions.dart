import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/customer.dart';
import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';

part 'subscription_actions.g.dart';

@JsonSerializable()
class LoadSubscriptionAction {
  final Customer customer;

  LoadSubscriptionAction({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadSubscriptionActionToJson(this);
}

@JsonSerializable()
class LoadSubscriptionSuccess {
  final Subscription subscription;

  LoadSubscriptionSuccess({@required this.subscription});
  Map<String, dynamic> toJson() => _$LoadSubscriptionSuccessToJson(this);
}

@JsonSerializable()
class LoadSubscriptionFailure {
  final String error;

  LoadSubscriptionFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadSubscriptionFailureToJson(this);
}
