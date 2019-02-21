// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadCustomerAction _$LoadCustomerActionFromJson(Map<String, dynamic> json) {
  return LoadCustomerAction(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadCustomerActionToJson(LoadCustomerAction instance) =>
    <String, dynamic>{'user': instance.user};

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
