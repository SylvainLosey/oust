// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadCustomerSuccess _$LoadCustomerSuccessFromJson(Map<String, dynamic> json) {
  return LoadCustomerSuccess(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
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
