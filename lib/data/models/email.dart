library email;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'email.g.dart';

abstract class Email implements Built<Email, EmailBuilder> {
  factory Email([void Function(EmailBuilder) updates]) = _$Email;

  @nullable
  int get id;

  @nullable
  String get email;
  
  @nullable
  @BuiltValueField(wireName: 'used_for_invoices')
  bool get usedForInvoices;

  @nullable
  int get customer;

  Email._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Email.serializer, this);
  }

  static Email fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Email.serializer, jsonString);
  }

  static Serializer<Email> get serializer => _$emailSerializer;
}