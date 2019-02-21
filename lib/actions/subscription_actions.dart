import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../models/customer.dart';
import '../models/pickup.dart';
import '../models/subscription.dart';

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

@JsonSerializable()
class LoadPickupsAction {
  final Subscription subscription;

  LoadPickupsAction({@required this.subscription});
  Map<String, dynamic> toJson() => _$LoadPickupsActionToJson(this);
}

@JsonSerializable()
class LoadPickupsSuccess {
  final List<Pickup> pickups;

  LoadPickupsSuccess({@required this.pickups});
  Map<String, dynamic> toJson() => _$LoadPickupsSuccessToJson(this);
}

@JsonSerializable()
class LoadPickupsFailure {
  final String error;

  LoadPickupsFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPickupsFailureToJson(this);
}