// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadPostcodesRequest _$LoadPostcodesRequestFromJson(Map<String, dynamic> json) {
  return LoadPostcodesRequest();
}

Map<String, dynamic> _$LoadPostcodesRequestToJson(
        LoadPostcodesRequest instance) =>
    <String, dynamic>{};

LoadPostcodesFailure _$LoadPostcodesFailureFromJson(Map<String, dynamic> json) {
  return LoadPostcodesFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadPostcodesFailureToJson(
        LoadPostcodesFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadPackagesRequest _$LoadPackagesRequestFromJson(Map<String, dynamic> json) {
  return LoadPackagesRequest();
}

Map<String, dynamic> _$LoadPackagesRequestToJson(
        LoadPackagesRequest instance) =>
    <String, dynamic>{};

LoadPackagesFailure _$LoadPackagesFailureFromJson(Map<String, dynamic> json) {
  return LoadPackagesFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadPackagesFailureToJson(
        LoadPackagesFailure instance) =>
    <String, dynamic>{'error': instance.error};
