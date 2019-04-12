library subscriptionRegisterState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../../data/models/subscription_register.dart';
import '../../../data/models/serializers.dart';

part 'subscription_register_state.g.dart';

abstract class SubscriptionRegisterState implements Built<SubscriptionRegisterState, SubscriptionRegisterStateBuilder> {
  bool get isLoading;
  @nullable
  SubscriptionRegister get subscriptionRegister;
  @nullable
  String get error;

  SubscriptionRegisterState._();

  factory SubscriptionRegisterState([void Function(SubscriptionRegisterStateBuilder) updates]) => _$SubscriptionRegisterState((b) => b
    ..isLoading = false
    ..subscriptionRegister = SubscriptionRegister().toBuilder()
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionRegisterState.serializer, this);
  }

  static SubscriptionRegisterState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionRegisterState.serializer, jsonString);
  }

  static Serializer<SubscriptionRegisterState> get serializer => _$subscriptionRegisterStateSerializer;
}