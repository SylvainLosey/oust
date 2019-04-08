// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(token: json['token'] as String, id: json['id'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'token': instance.token, 'id': instance.id};
