// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadLiftsRequest _$LoadLiftsRequestFromJson(Map<String, dynamic> json) {
  return LoadLiftsRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadLiftsRequestToJson(LoadLiftsRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadLiftsFailure _$LoadLiftsFailureFromJson(Map<String, dynamic> json) {
  return LoadLiftsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadLiftsFailureToJson(LoadLiftsFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadLiftImagesRequest _$LoadLiftImagesRequestFromJson(
    Map<String, dynamic> json) {
  return LoadLiftImagesRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadLiftImagesRequestToJson(
        LoadLiftImagesRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadLiftImagesFailure _$LoadLiftImagesFailureFromJson(
    Map<String, dynamic> json) {
  return LoadLiftImagesFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadLiftImagesFailureToJson(
        LoadLiftImagesFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateLiftRequest _$CreateLiftRequestFromJson(Map<String, dynamic> json) {
  return CreateLiftRequest(
      customerId: json['customerId'] as int,
      floor: json['floor'] as int,
      elevator: json['elevator'] as bool,
      customerNote: json['customerNote'] as String);
}

Map<String, dynamic> _$CreateLiftRequestToJson(CreateLiftRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'floor': instance.floor,
      'elevator': instance.elevator,
      'customerNote': instance.customerNote
    };

CreateLiftSuccess _$CreateLiftSuccessFromJson(Map<String, dynamic> json) {
  return CreateLiftSuccess();
}

Map<String, dynamic> _$CreateLiftSuccessToJson(CreateLiftSuccess instance) =>
    <String, dynamic>{};

CreateLiftFailure _$CreateLiftFailureFromJson(Map<String, dynamic> json) {
  return CreateLiftFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateLiftFailureToJson(CreateLiftFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateLiftImageRequest _$CreateLiftImageRequestFromJson(
    Map<String, dynamic> json) {
  return CreateLiftImageRequest(
      liftId: json['liftId'] as int,
      url: json['url'] as String,
      uuid: json['uuid'] as String);
}

Map<String, dynamic> _$CreateLiftImageRequestToJson(
        CreateLiftImageRequest instance) =>
    <String, dynamic>{
      'liftId': instance.liftId,
      'uuid': instance.uuid,
      'url': instance.url
    };

CreateLiftImageSuccess _$CreateLiftImageSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateLiftImageSuccess();
}

Map<String, dynamic> _$CreateLiftImageSuccessToJson(
        CreateLiftImageSuccess instance) =>
    <String, dynamic>{};

CreateLiftImageFailure _$CreateLiftImageFailureFromJson(
    Map<String, dynamic> json) {
  return CreateLiftImageFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateLiftImageFailureToJson(
        CreateLiftImageFailure instance) =>
    <String, dynamic>{'error': instance.error};
