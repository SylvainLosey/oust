import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../../data/models/subscription_form.dart';

part 'subscription_form_state.g.dart';

@JsonSerializable()
@immutable
class SubscriptionFormState {
  final SubscriptionForm subscriptionForm;
  final bool isLoading;
  final String error;

  SubscriptionFormState({
    @required this.subscriptionForm,
    @required this.isLoading,
    @required this.error,
  });

  factory SubscriptionFormState.fromJson(Map<String, dynamic> json) => _$SubscriptionFormStateFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionFormStateToJson(this);

  factory SubscriptionFormState.initial() {
    return SubscriptionFormState(
      subscriptionForm: null,
      isLoading: null,
      error: null,
    );
  }

  SubscriptionFormState copyWith({
    SubscriptionForm subscriptionForm,
    bool isLoading,
    String error
  }) {
    return SubscriptionFormState(
      subscriptionForm: subscriptionForm ?? this.subscriptionForm,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}