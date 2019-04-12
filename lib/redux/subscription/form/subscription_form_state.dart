library subscriptionFormState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../../data/models/subscription_form.dart';
import '../../../data/models/serializers.dart';

part 'subscription_form_state.g.dart';

abstract class SubscriptionFormState implements Built<SubscriptionFormState, SubscriptionFormStateBuilder> {
  bool get isLoading;
  @nullable
  SubscriptionForm get subscriptionForm;
  @nullable
  String get error;

  SubscriptionFormState._();

  factory SubscriptionFormState([void Function(SubscriptionFormStateBuilder) updates]) => _$SubscriptionFormState((b) => b
    ..isLoading = false
    ..subscriptionForm = SubscriptionForm().toBuilder()
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionFormState.serializer, this);
  }

  static SubscriptionFormState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionFormState.serializer, jsonString);
  }

  static Serializer<SubscriptionFormState> get serializer => _$subscriptionFormStateSerializer;
}