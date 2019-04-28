library CustomerState;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/customer.dart';
import '../../data/models/serializers.dart';

part 'customer_state.g.dart';

abstract class CustomerState implements Built<CustomerState, CustomerStateBuilder> {
  static Serializer<CustomerState> get serializer => _$customerStateSerializer;
  factory CustomerState() => _$CustomerState((CustomerStateBuilder b) => b
    ..isLoading = false
  );
  
  CustomerState._();

  @nullable
  Customer get customer;

  @nullable
  String get error;

  bool get isLoading;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CustomerState.serializer, this);
  }

  static CustomerState fromJson(String jsonString) {
    return serializers.deserializeWith(CustomerState.serializer, json.decode(jsonString));
  }
}