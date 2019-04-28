library subscriptionFormState;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../../data/models/serializers.dart';
import '../../../data/models/subscription_form.dart';

part 'subscription_form_state.g.dart';

abstract class SubscriptionFormState implements Built<SubscriptionFormState, SubscriptionFormStateBuilder> {
  static Serializer<SubscriptionFormState> get serializer => _$subscriptionFormStateSerializer;
  factory SubscriptionFormState() => _$SubscriptionFormState((b) => b
    ..isLoading = false
    ..subscriptionForm = SubscriptionForm().toBuilder()
  );
  
  SubscriptionFormState._();

  @nullable
  String get error;

  bool get isLoading;

  @nullable
  SubscriptionForm get subscriptionForm;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionFormState.serializer, this);
  }

  static SubscriptionFormState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionFormState.serializer, jsonString);
  }
}