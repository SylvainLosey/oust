library CustomerState;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/customer.dart';
import '../../data/models/serializers.dart';

part 'customer_state.g.dart';

abstract class CustomerState implements Built<CustomerState, CustomerStateBuilder> {
  bool get isLoading;
  @nullable
  Customer get customer;
  @nullable
  String get error;

  CustomerState._();

  factory CustomerState([updates(CustomerStateBuilder b)]) => _$CustomerState((b) => b
    ..isLoading = false
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CustomerState.serializer, this);
  }

  static CustomerState fromJson(String jsonString) {
    return serializers.deserializeWith(CustomerState.serializer, json.decode(jsonString));
  }

  static Serializer<CustomerState> get serializer => _$customerStateSerializer;
}