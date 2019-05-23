library customer;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'customer.g.dart';

abstract class Customer implements Built<Customer, CustomerBuilder> {
  static Serializer<Customer> get serializer => _$customerSerializer;

  factory Customer([void Function(CustomerBuilder) updates]) = _$Customer;

  Customer._();

  @nullable
  int get user;

  @nullable
  int get id;

  @nullable
  String get gender;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get address;

  @nullable
  String get city;

  @nullable
  int get postcode;

  @nullable
  String get company;

  @nullable
  @BuiltValueField(wireName: 'customer_status')
  String get customerStatus;

  @nullable
  @BuiltValueField(wireName: 'prefered_communication')
  String get preferedCommunication;

  @nullable
  @BuiltValueField(wireName: 'prefered_payment_method')
  String get preferedPaymentMethod;

  @nullable
  @BuiltValueField(wireName: 'has_subscription')
  bool get hasSubscription;

  @nullable
  @BuiltValueField(wireName: 'has_lift')
  bool get hasLift;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Customer.serializer, this);
  }

  static Customer fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Customer.serializer, jsonString);
  }
}
