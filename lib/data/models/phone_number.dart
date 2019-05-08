library phone_number;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'phone_number.g.dart';


abstract class PhoneNumber implements Built<PhoneNumber, PhoneNumberBuilder> {
  factory PhoneNumber([void Function(PhoneNumberBuilder) updates]) = _$PhoneNumber;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'number_type')
  String get numberType;

  @nullable
  bool get reminder;

  @nullable
  int get customer;

  PhoneNumber._();


  Map<String, dynamic> toJson() {
    return serializers.serializeWith(PhoneNumber.serializer, this);
  }

  static PhoneNumber fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(PhoneNumber.serializer, jsonString);
  }

  static Serializer<PhoneNumber> get serializer => _$phoneNumberSerializer;
}