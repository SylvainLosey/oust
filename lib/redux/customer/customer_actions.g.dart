// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadCustomerRequest _$LoadCustomerRequestFromJson(Map<String, dynamic> json) {
  return LoadCustomerRequest(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadCustomerRequestToJson(
        LoadCustomerRequest instance) =>
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

CreateCustomerRequest _$CreateCustomerRequestFromJson(
    Map<String, dynamic> json) {
  return CreateCustomerRequest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      preferedCommunication: json['preferedCommunication'] as String,
      postcode: json['postcode'] as int,
      userId: json['userId'] as int);
}

Map<String, dynamic> _$CreateCustomerRequestToJson(
        CreateCustomerRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'preferedCommunication': instance.preferedCommunication,
      'postcode': instance.postcode,
      'userId': instance.userId
    };

CreateCustomerSuccess _$CreateCustomerSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateCustomerSuccess();
}

Map<String, dynamic> _$CreateCustomerSuccessToJson(
        CreateCustomerSuccess instance) =>
    <String, dynamic>{};

CreateCustomerFailure _$CreateCustomerFailureFromJson(
    Map<String, dynamic> json) {
  return CreateCustomerFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateCustomerFailureToJson(
        CreateCustomerFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadPhoneNumbersRequest _$LoadPhoneNumbersRequestFromJson(
    Map<String, dynamic> json) {
  return LoadPhoneNumbersRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadPhoneNumbersRequestToJson(
        LoadPhoneNumbersRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadPhoneNumbersFailure _$LoadPhoneNumbersFailureFromJson(
    Map<String, dynamic> json) {
  return LoadPhoneNumbersFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadPhoneNumbersFailureToJson(
        LoadPhoneNumbersFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadEmailsRequest _$LoadEmailsRequestFromJson(Map<String, dynamic> json) {
  return LoadEmailsRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadEmailsRequestToJson(LoadEmailsRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadEmailsFailure _$LoadEmailsFailureFromJson(Map<String, dynamic> json) {
  return LoadEmailsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadEmailsFailureToJson(LoadEmailsFailure instance) =>
    <String, dynamic>{'error': instance.error};
