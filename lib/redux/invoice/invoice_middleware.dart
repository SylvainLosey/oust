import 'package:redux/redux.dart';

import 'invoice_actions.dart';
import '../app/app_state.dart';
import '../../data/models/invoice.dart';
import '../../data/models/invoice_item.dart';
import '../../data/repository.dart';

class InvoiceMiddleware {
  final Repository repository;
  const InvoiceMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createInvoiceMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadInvoicesRequest>(_loadInvoicesRequest),
      TypedMiddleware<AppState, LoadInvoiceItemsRequest>(_loadInvoiceItemsRequest),
    ];
  }

  void _loadInvoicesRequest(Store<AppState> store, LoadInvoicesRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> data = await repository.fetchInvoices(action.customer.id);
      final List<Invoice> invoices = List<Invoice>.from(data.map<dynamic>((dynamic x) => Invoice.fromJson(x)));
      store.dispatch(LoadInvoicesSuccess(invoices: invoices));
    } catch (e) {
      store.dispatch(LoadInvoicesFailure(error: e.toString()));
    }
  }

  void _loadInvoiceItemsRequest(Store<AppState> store, LoadInvoiceItemsRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> data = await repository.fetchInvoiceItems(action.customer.id);
      final List<InvoiceItem> invoiceItems = List<InvoiceItem>.from(data.map<dynamic>((dynamic x) => InvoiceItem.fromJson(x)));
      store.dispatch(LoadInvoiceItemsSuccess(invoiceItems: invoiceItems));
    } catch (e) {
      store.dispatch(LoadInvoiceItemsFailure(error: e.toString()));
    }
  }
}