// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadSubscriptionRequest _$LoadSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadSubscriptionRequestToJson(
        LoadSubscriptionRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadSubscriptionSuccess _$LoadSubscriptionSuccessFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionSuccess(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(
              json['subscription'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadSubscriptionSuccessToJson(
        LoadSubscriptionSuccess instance) =>
    <String, dynamic>{'subscription': instance.subscription};

LoadSubscriptionFailure _$LoadSubscriptionFailureFromJson(
    Map<String, dynamic> json) {
  return LoadSubscriptionFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadSubscriptionFailureToJson(
        LoadSubscriptionFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadConsumerSubscriptionRequest _$LoadConsumerSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return LoadConsumerSubscriptionRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadConsumerSubscriptionRequestToJson(
        LoadConsumerSubscriptionRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadConsumerSubscriptionSuccess _$LoadConsumerSubscriptionSuccessFromJson(
    Map<String, dynamic> json) {
  return LoadConsumerSubscriptionSuccess(
      consumerSubscription: json['consumerSubscription'] == null
          ? null
          : ConsumerSubscription.fromJson(
              json['consumerSubscription'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadConsumerSubscriptionSuccessToJson(
        LoadConsumerSubscriptionSuccess instance) =>
    <String, dynamic>{'consumerSubscription': instance.consumerSubscription};

LoadConsumerSubscriptionFailure _$LoadConsumerSubscriptionFailureFromJson(
    Map<String, dynamic> json) {
  return LoadConsumerSubscriptionFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadConsumerSubscriptionFailureToJson(
        LoadConsumerSubscriptionFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateSubscriptionRequest _$CreateSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return CreateSubscriptionRequest(
      baseDate: json['baseDate'] == null
          ? null
          : DateTime.parse(json['baseDate'] as String),
      note: json['note'] as String,
      customerId: json['customerId'] as int);
}

Map<String, dynamic> _$CreateSubscriptionRequestToJson(
        CreateSubscriptionRequest instance) =>
    <String, dynamic>{
      'baseDate': instance.baseDate?.toIso8601String(),
      'note': instance.note,
      'customerId': instance.customerId
    };

CreateSubscriptionSuccess _$CreateSubscriptionSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateSubscriptionSuccess();
}

Map<String, dynamic> _$CreateSubscriptionSuccessToJson(
        CreateSubscriptionSuccess instance) =>
    <String, dynamic>{};

CreateSubscriptionFailure _$CreateSubscriptionFailureFromJson(
    Map<String, dynamic> json) {
  return CreateSubscriptionFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateSubscriptionFailureToJson(
        CreateSubscriptionFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateConsumerSubscriptionRequest _$CreateConsumerSubscriptionRequestFromJson(
    Map<String, dynamic> json) {
  return CreateConsumerSubscriptionRequest(
      packageId: json['packageId'] as int,
      subscriptionId: json['subscriptionId'] as int);
}

Map<String, dynamic> _$CreateConsumerSubscriptionRequestToJson(
        CreateConsumerSubscriptionRequest instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'subscriptionId': instance.subscriptionId
    };

CreateConsumerSubscriptionSuccess _$CreateConsumerSubscriptionSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateConsumerSubscriptionSuccess();
}

Map<String, dynamic> _$CreateConsumerSubscriptionSuccessToJson(
        CreateConsumerSubscriptionSuccess instance) =>
    <String, dynamic>{};

CreateConsumerSubscriptionFailure _$CreateConsumerSubscriptionFailureFromJson(
    Map<String, dynamic> json) {
  return CreateConsumerSubscriptionFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateConsumerSubscriptionFailureToJson(
        CreateConsumerSubscriptionFailure instance) =>
    <String, dynamic>{'error': instance.error};
