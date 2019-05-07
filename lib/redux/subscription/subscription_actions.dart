import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

import '../../data/models/customer.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';

part 'subscription_actions.g.dart';


/// SUBSCRIPTION

@JsonSerializable()
class LoadSubscriptionRequest {
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadSubscriptionRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadSubscriptionRequestToJson(this);
}

@JsonSerializable()
class LoadSubscriptionSuccess {
  @JsonKey(fromJson: Subscription.fromJson) 
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
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadConsumerSubscriptionRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadConsumerSubscriptionRequestToJson(this);
}

@JsonSerializable()
class LoadConsumerSubscriptionSuccess {
  @JsonKey(fromJson: ConsumerSubscription.fromJson)
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


// Reducer not yet created - Not sure if nexessary

@JsonSerializable()
class CreateSubscriptionRequest {
  final DateTime baseDate;
  final String note;
  final int customerId;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateSubscriptionRequest({this.baseDate, this.note, this.customerId, this.completer});
  Map<String, dynamic> toJson() => _$CreateSubscriptionRequestToJson(this);
}

@JsonSerializable()
class CreateSubscriptionSuccess {
    Map<String, dynamic> toJson() => _$CreateSubscriptionSuccessToJson(this);
}

@JsonSerializable()
class CreateSubscriptionFailure {
  final String error;

  CreateSubscriptionFailure({this.error});
  Map<String, dynamic> toJson() => _$CreateSubscriptionFailureToJson(this);
}


@JsonSerializable()
class CreateConsumerSubscriptionRequest {
  final int packageId;
  final int subscriptionId;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateConsumerSubscriptionRequest({this.packageId, this.subscriptionId, this.completer});
  Map<String, dynamic> toJson() => _$CreateConsumerSubscriptionRequestToJson(this);
}

@JsonSerializable()
class CreateConsumerSubscriptionSuccess {
    Map<String, dynamic> toJson() => _$CreateConsumerSubscriptionSuccessToJson(this);
}

@JsonSerializable()
class CreateConsumerSubscriptionFailure {
  final String error;

  CreateConsumerSubscriptionFailure({this.error});
  Map<String, dynamic> toJson() => _$CreateConsumerSubscriptionFailureToJson(this);
}

