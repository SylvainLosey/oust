import 'package:meta/meta.dart';

import 'customer_model.dart';

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
      isLoading: false,
      customer: null,
      error: null,
    );
  }

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