// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerState _$CustomerStateFromJson(Map<String, dynamic> json) {
  return CustomerState(
      isLoading: json['isLoading'] as bool,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      error: json['error'] as String);
}

Map<String, dynamic> _$CustomerStateToJson(CustomerState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'customer': instance.customer,
      'error': instance.error
    };
