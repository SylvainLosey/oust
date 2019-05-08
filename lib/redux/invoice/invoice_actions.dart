import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';
import '../../data/models/customer.dart';

part 'invoice_actions.g.dart';


// INVOICE
@JsonSerializable()
class LoadInvoicesRequest {
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadInvoicesRequest({this.customer});
  Map<String, dynamic> toJson() => _$LoadInvoicesRequestToJson(this);
}

class LoadInvoicesSuccess {
  final List<Invoice> invoices;

  LoadInvoicesSuccess({this.invoices});
}

@JsonSerializable()
class LoadInvoicesFailure {
  final String error;

  LoadInvoicesFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadInvoicesFailureToJson(this);
}


// INVOICE ITEMS
@JsonSerializable()
class LoadInvoiceItemsRequest {
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadInvoiceItemsRequest({this.customer});
  Map<String, dynamic> toJson() => _$LoadInvoiceItemsRequestToJson(this);
}

class LoadInvoiceItemsSuccess {
  final List<InvoiceItem> invoiceItems;

  LoadInvoiceItemsSuccess({this.invoiceItems});
}

@JsonSerializable()
class LoadInvoiceItemsFailure {
  final String error;

  LoadInvoiceItemsFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadInvoiceItemsFailureToJson(this);
}