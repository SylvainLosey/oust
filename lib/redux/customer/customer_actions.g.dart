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

CreatePhoneNumberRequest _$CreatePhoneNumberRequestFromJson(
    Map<String, dynamic> json) {
  return CreatePhoneNumberRequest(
      phoneNumber: json['phoneNumber'] as String,
      numberType: json['numberType'] as String,
      reminder: json['reminder'] as bool,
      customerId: json['customerId'] as int);
}

Map<String, dynamic> _$CreatePhoneNumberRequestToJson(
        CreatePhoneNumberRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'numberType': instance.numberType,
      'reminder': instance.reminder,
      'customerId': instance.customerId
    };

CreatePhoneNumberSuccess _$CreatePhoneNumberSuccessFromJson(
    Map<String, dynamic> json) {
  return CreatePhoneNumberSuccess();
}

Map<String, dynamic> _$CreatePhoneNumberSuccessToJson(
        CreatePhoneNumberSuccess instance) =>
    <String, dynamic>{};

CreatePhoneNumberFailure _$CreatePhoneNumberFailureFromJson(
    Map<String, dynamic> json) {
  return CreatePhoneNumberFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreatePhoneNumberFailureToJson(
        CreatePhoneNumberFailure instance) =>
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

CreateEmailRequest _$CreateEmailRequestFromJson(Map<String, dynamic> json) {
  return CreateEmailRequest(
      email: json['email'] as String,
      usedForInvoices: json['usedForInvoices'] as bool,
      customerId: json['customerId'] as int);
}

Map<String, dynamic> _$CreateEmailRequestToJson(CreateEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'usedForInvoices': instance.usedForInvoices,
      'customerId': instance.customerId
    };

CreateEmailSuccess _$CreateEmailSuccessFromJson(Map<String, dynamic> json) {
  return CreateEmailSuccess();
}

Map<String, dynamic> _$CreateEmailSuccessToJson(CreateEmailSuccess instance) =>
    <String, dynamic>{};

CreateEmailFailure _$CreateEmailFailureFromJson(Map<String, dynamic> json) {
  return CreateEmailFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateEmailFailureToJson(CreateEmailFailure instance) =>
    <String, dynamic>{'error': instance.error};
