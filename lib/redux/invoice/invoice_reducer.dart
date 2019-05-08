import 'package:redux/redux.dart';

import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';
import 'invoice_actions.dart';
import 'invoice_state.dart';

Reducer<InvoiceState> invoiceReducer = combineReducers([
  TypedReducer<InvoiceState, LoadInvoicesRequest>(_loadInvoicesRequest),
  TypedReducer<InvoiceState, LoadInvoicesSuccess>(_loadInvoicesSuccess),
  TypedReducer<InvoiceState, LoadInvoicesFailure>(_loadInvoicesFailure),
  TypedReducer<InvoiceState, LoadInvoiceItemsRequest>(_loadInvoiceItemsRequest),
  TypedReducer<InvoiceState, LoadInvoiceItemsSuccess>(_loadInvoiceItemsSuccess),
  TypedReducer<InvoiceState, LoadInvoiceItemsFailure>(_loadInvoiceItemsFailure),
]);

// INVOICES
InvoiceState _loadInvoicesRequest(InvoiceState state, LoadInvoicesRequest action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

InvoiceState _loadInvoicesSuccess(InvoiceState state, LoadInvoicesSuccess action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..invoices.replace(Map<int, Invoice>.fromIterable(
      action.invoices,
      key: (dynamic invoice) => invoice.id,
      value: (dynamic invoice) => invoice,
    ))
  );
}

InvoiceState _loadInvoicesFailure(InvoiceState state, LoadInvoicesFailure action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}


// INVOICE ITEMS
InvoiceState _loadInvoiceItemsRequest(InvoiceState state, LoadInvoiceItemsRequest action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

InvoiceState _loadInvoiceItemsSuccess(InvoiceState state, LoadInvoiceItemsSuccess action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..invoiceItems.replace(Map<int, InvoiceItem>.fromIterable(
      action.invoiceItems,
      key: (dynamic invoiceItem) => invoiceItem.id,
      value: (dynamic invoiceItem) => invoiceItem,
    ))
  );
}

InvoiceState _loadInvoiceItemsFailure(InvoiceState state, LoadInvoiceItemsFailure action) {
  return state.rebuild((InvoiceStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}