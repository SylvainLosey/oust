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

ViewLiftDetail _$ViewLiftDetailFromJson(Map<String, dynamic> json) {
  return ViewLiftDetail(liftId: json['liftId'] as int);
}

Map<String, dynamic> _$ViewLiftDetailToJson(ViewLiftDetail instance) =>
    <String, dynamic>{'liftId': instance.liftId};

UpdateLiftRequest _$UpdateLiftRequestFromJson(Map<String, dynamic> json) {
  return UpdateLiftRequest(
      lift: json['lift'] == null
          ? null
          : Lift.fromJson(json['lift'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateLiftRequestToJson(UpdateLiftRequest instance) =>
    <String, dynamic>{'lift': instance.lift};

UpdateLiftSuccess _$UpdateLiftSuccessFromJson(Map<String, dynamic> json) {
  return UpdateLiftSuccess(
      lift: json['lift'] == null
          ? null
          : Lift.fromJson(json['lift'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateLiftSuccessToJson(UpdateLiftSuccess instance) =>
    <String, dynamic>{'lift': instance.lift};

UpdateLiftFailure _$UpdateLiftFailureFromJson(Map<String, dynamic> json) {
  return UpdateLiftFailure(error: json['error'] as String);
}

Map<String, dynamic> _$UpdateLiftFailureToJson(UpdateLiftFailure instance) =>
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

LoadLiftEventsRequest _$LoadLiftEventsRequestFromJson(
    Map<String, dynamic> json) {
  return LoadLiftEventsRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadLiftEventsRequestToJson(
        LoadLiftEventsRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadLiftEventsFailure _$LoadLiftEventsFailureFromJson(
    Map<String, dynamic> json) {
  return LoadLiftEventsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadLiftEventsFailureToJson(
        LoadLiftEventsFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateLiftEventRequest _$CreateLiftEventRequestFromJson(
    Map<String, dynamic> json) {
  return CreateLiftEventRequest(
      lift: json['lift'] == null
          ? null
          : Lift.fromJson(json['lift'] as Map<String, dynamic>),
      flexible: json['flexible'] as bool,
      selectedLiftSlot: json['selectedLiftSlot'] == null
          ? null
          : DateTime.parse(json['selectedLiftSlot'] as String));
}

Map<String, dynamic> _$CreateLiftEventRequestToJson(
        CreateLiftEventRequest instance) =>
    <String, dynamic>{
      'lift': instance.lift,
      'flexible': instance.flexible,
      'selectedLiftSlot': instance.selectedLiftSlot?.toIso8601String()
    };

CreateLiftEventSuccess _$CreateLiftEventSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateLiftEventSuccess();
}

Map<String, dynamic> _$CreateLiftEventSuccessToJson(
        CreateLiftEventSuccess instance) =>
    <String, dynamic>{};

CreateLiftEventFailure _$CreateLiftEventFailureFromJson(
    Map<String, dynamic> json) {
  return CreateLiftEventFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateLiftEventFailureToJson(
        CreateLiftEventFailure instance) =>
    <String, dynamic>{'error': instance.error};
