import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'customer.dart';

part 'customer_state.g.dart';

@JsonSerializable()
@immutable
class CustomerState {
  final bool isLoading;
  final Customer customer;
  final String error;

  CustomerState({
    @required this.isLoading,
    @required this.customer,
    @required this.error,
  });

  factory CustomerState.initial() {
    return CustomerState(
      isLoading: true,
      customer: null,
      error: null,
    );
  }

 factory CustomerState.fromJson(Map<String, dynamic> json) => _$CustomerStateFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerStateToJson(this);


  CustomerState copyWith({
    bool isLoading,
    Customer customer,
    String error
  }) {
    return CustomerState(
      isLoading: isLoading ?? this.isLoading,
      customer: customer ?? this.customer,
      error: error ?? this.error,
    );
  }
}