// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadCustomerRequest _$LoadCustomerRequestFromJson(Map<String, dynamic> json) {
  return LoadCustomerRequest(
      user:
          json['user'] == null ? null : User.fromJson(json['user'] as String));
}

Map<String, dynamic> _$LoadCustomerRequestToJson(
        LoadCustomerRequest instance) =>
    <String, dynamic>{'user': instance.user};

LoadCustomerSuccess _$LoadCustomerSuccessFromJson(Map<String, dynamic> json) {
  return LoadCustomerSuccess(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as String));
}

Map<String, dynamic> _$LoadCustomerSuccessToJson(
        LoadCustomerSuccess instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadCustomerFailure _$LoadCustomerFailureFromJson(Map<String, dynamic> json) {
  return LoadCustomerFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadCustomerFailureToJson(
        LoadCustomerFailure instance) =>
    <String, dynamic>{'error': instance.error};
