// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lift_quote_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLiftImage _$AddLiftImageFromJson(Map<String, dynamic> json) {
  return AddLiftImage(uuid: json['uuid'] as String);
}

Map<String, dynamic> _$AddLiftImageToJson(AddLiftImage instance) =>
    <String, dynamic>{'uuid': instance.uuid};

AddLiftImageSuccess _$AddLiftImageSuccessFromJson(Map<String, dynamic> json) {
  return AddLiftImageSuccess(
      uuid: json['uuid'] as String, url: json['url'] as String);
}

Map<String, dynamic> _$AddLiftImageSuccessToJson(
        AddLiftImageSuccess instance) =>
    <String, dynamic>{'uuid': instance.uuid, 'url': instance.url};

AddLiftImageFailure _$AddLiftImageFailureFromJson(Map<String, dynamic> json) {
  return AddLiftImageFailure(error: json['error'] as String);
}

Map<String, dynamic> _$AddLiftImageFailureToJson(
        AddLiftImageFailure instance) =>
    <String, dynamic>{'error': instance.error};

DeleteLiftImage _$DeleteLiftImageFromJson(Map<String, dynamic> json) {
  return DeleteLiftImage(
      image: json['image'] == null
          ? null
          : LiftImage.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DeleteLiftImageToJson(DeleteLiftImage instance) =>
    <String, dynamic>{'image': instance.image};

DeleteLiftImageSuccess _$DeleteLiftImageSuccessFromJson(
    Map<String, dynamic> json) {
  return DeleteLiftImageSuccess();
}

Map<String, dynamic> _$DeleteLiftImageSuccessToJson(
        DeleteLiftImageSuccess instance) =>
    <String, dynamic>{};

DeleteLiftImageFailure _$DeleteLiftImageFailureFromJson(
    Map<String, dynamic> json) {
  return DeleteLiftImageFailure(error: json['error'] as String);
}

Map<String, dynamic> _$DeleteLiftImageFailureToJson(
        DeleteLiftImageFailure instance) =>
    <String, dynamic>{'error': instance.error};
