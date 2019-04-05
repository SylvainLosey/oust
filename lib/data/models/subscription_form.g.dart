// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionForm _$SubscriptionFormFromJson(Map<String, dynamic> json) {
  return SubscriptionForm(
      currentStep: json['currentStep'] as int,
      packageId: json['packageId'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      postcodeId: json['postcodeId'] as int,
      appRegistration: json['appRegistration'] as bool,
      smallBins: json['smallBins'] as int,
      bigBins: json['bigBins'] as int,
      accessType: json['accessType'] as int,
      code: json['code'] as String,
      doorKey: json['doorKey'] as bool,
      note: json['note'] as String,
      phoneNumber: json['phoneNumber'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      email: json['email'] as String,
      password: json['password'] as String);
}

Map<String, dynamic> _$SubscriptionFormToJson(SubscriptionForm instance) =>
    <String, dynamic>{
      'currentStep': instance.currentStep,
      'packageId': instance.packageId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'postcodeId': instance.postcodeId,
      'appRegistration': instance.appRegistration,
      'smallBins': instance.smallBins,
      'bigBins': instance.bigBins,
      'accessType': instance.accessType,
      'code': instance.code,
      'doorKey': instance.doorKey,
      'note': instance.note,
      'phoneNumber': instance.phoneNumber,
      'startDate': instance.startDate?.toIso8601String(),
      'email': instance.email,
      'password': instance.password
    };
