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
