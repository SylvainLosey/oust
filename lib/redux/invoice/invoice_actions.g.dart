// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadInvoicesRequest _$LoadInvoicesRequestFromJson(Map<String, dynamic> json) {
  return LoadInvoicesRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadInvoicesRequestToJson(
        LoadInvoicesRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadInvoicesFailure _$LoadInvoicesFailureFromJson(Map<String, dynamic> json) {
  return LoadInvoicesFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadInvoicesFailureToJson(
        LoadInvoicesFailure instance) =>
    <String, dynamic>{'error': instance.error};

LoadInvoiceItemsRequest _$LoadInvoiceItemsRequestFromJson(
    Map<String, dynamic> json) {
  return LoadInvoiceItemsRequest(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoadInvoiceItemsRequestToJson(
        LoadInvoiceItemsRequest instance) =>
    <String, dynamic>{'customer': instance.customer};

LoadInvoiceItemsFailure _$LoadInvoiceItemsFailureFromJson(
    Map<String, dynamic> json) {
  return LoadInvoiceItemsFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadInvoiceItemsFailureToJson(
        LoadInvoiceItemsFailure instance) =>
    <String, dynamic>{'error': instance.error};
