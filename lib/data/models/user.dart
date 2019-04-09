library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  @nullable
  String get key;

  @nullable
  @BuiltValueField(wireName: 'user')
  int get id;
  
  User._();

  factory User([void Function (UserBuilder) updates]) = _$User;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}