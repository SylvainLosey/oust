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

CreateInvoiceItemRequest _$CreateInvoiceItemRequestFromJson(
    Map<String, dynamic> json) {
  return CreateInvoiceItemRequest(
      productId: json['productId'] as int,
      amount: json['amount'] as int,
      customerId: json['customerId'] as int);
}

Map<String, dynamic> _$CreateInvoiceItemRequestToJson(
        CreateInvoiceItemRequest instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'amount': instance.amount,
      'customerId': instance.customerId
    };

CreateInvoiceItemSuccess _$CreateInvoiceItemSuccessFromJson(
    Map<String, dynamic> json) {
  return CreateInvoiceItemSuccess();
}

Map<String, dynamic> _$CreateInvoiceItemSuccessToJson(
        CreateInvoiceItemSuccess instance) =>
    <String, dynamic>{};

CreateInvoiceItemFailure _$CreateInvoiceItemFailureFromJson(
    Map<String, dynamic> json) {
  return CreateInvoiceItemFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateInvoiceItemFailureToJson(
        CreateInvoiceItemFailure instance) =>
    <String, dynamic>{'error': instance.error};
