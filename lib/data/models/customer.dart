library customer;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  Customer._();

  factory Customer([void Function (CustomerBuilder) updates]) = _$Customer;

  int get id;
  @BuiltValueField(wireName: 'customer_status')
  String get customerStatus;
  @nullable
  String get company;
  String get gender;
  @BuiltValueField(wireName: 'first_name')
  String get firstName;
  @BuiltValueField(wireName: 'last_name')
  String get lastName;
  String get address;
  String get city;
  @BuiltValueField(wireName: 'prefered_communication')
  String get preferedCommunication;
  @BuiltValueField(wireName: 'prefered_payment_method')
  String get preferedPaymentMethod;
  int get postcode;
  int get user;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Customer.serializer, this);
  }

  static Customer fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(
        Customer.serializer, jsonString);
  }

  static Serializer<Customer> get serializer => _$customerSerializer;
}
