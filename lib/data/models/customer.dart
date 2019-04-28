library customer;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  static Serializer<Customer> get serializer => _$customerSerializer;

  factory Customer([void Function (CustomerBuilder) updates]) = _$Customer;

  Customer._();
  String get address;
  String get city;
  @nullable
  String get company;
  @BuiltValueField(wireName: 'customer_status')
  String get customerStatus;
  @BuiltValueField(wireName: 'first_name')
  String get firstName;
  String get gender;
  int get id;
  @BuiltValueField(wireName: 'last_name')
  String get lastName;
  int get postcode;
  @BuiltValueField(wireName: 'prefered_communication')
  String get preferedCommunication;
  @BuiltValueField(wireName: 'prefered_payment_method')
  String get preferedPaymentMethod;

  int get user;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Customer.serializer, this);
  }

  static Customer fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
        Customer.serializer, jsonString);
  }
}
