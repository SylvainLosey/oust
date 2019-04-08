import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/customer.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/models/package.dart';

part 'subscription_actions.g.dart';


/// SUBSCRIPTION

@JsonSerializable()
class LoadSubscriptionRequest {
  final Customer customer;

  LoadSubscriptionRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadSubscriptionRequestToJson(this);
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


/// CONSUMER SUBSCRIPTION

@JsonSerializable()
class LoadConsumerSubscriptionRequest {
  final Customer customer;

  LoadConsumerSubscriptionRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadConsumerSubscriptionRequestToJson(this);
}

@JsonSerializable()
class LoadConsumerSubscriptionSuccess {
  final ConsumerSubscription consumerSubscription;

  LoadConsumerSubscriptionSuccess({@required this.consumerSubscription});
  Map<String, dynamic> toJson() => _$LoadConsumerSubscriptionSuccessToJson(this);
}

@JsonSerializable()
class LoadConsumerSubscriptionFailure {
  final String error;

  LoadConsumerSubscriptionFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadConsumerSubscriptionFailureToJson(this);
}

/// PACKAGES

@JsonSerializable()
class LoadPackagesRequest {
  LoadPackagesRequest();
  Map<String, dynamic> toJson() => _$LoadPackagesRequestToJson(this);
}

@JsonSerializable()
class LoadPackagesSuccess {
  final List<Package> packages;

  LoadPackagesSuccess({@required this.packages});
  Map<String, dynamic> toJson() => _$LoadPackagesSuccessToJson(this);
}

@JsonSerializable()
class LoadPackagesFailure {
  final String error;

  LoadPackagesFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPackagesFailureToJson(this);
}
