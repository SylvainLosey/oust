library user;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  factory User([void Function (UserBuilder) updates]) = _$User;
  
  User._();

  @nullable
  @BuiltValueField(wireName: 'user')
  int get id;

  @nullable
  String get key;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(User.serializer, jsonString);
  }
}
