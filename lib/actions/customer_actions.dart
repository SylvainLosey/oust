import 'package:meta/meta.dart';

import '../models/customer_model.dart';
import '../models/user.dart';

class LoadCustomerAction {
  final User user;

  LoadCustomerAction({@required this.user});
}

class LoadCustomerSuccess {
  final Customer customer;

  LoadCustomerSuccess({@required this.customer});
}

class LoadCustomerFailure {
  final String error;

  LoadCustomerFailure({@required this.error});
}