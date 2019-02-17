import 'package:meta/meta.dart';

import '../models/customer.dart';
import '../models/subscription.dart';

class LoadSubscriptionAction {
  final Customer customer;

  LoadSubscriptionAction({@required this.customer});
}

class LoadSubscriptionSuccess {
  final Subscription subscription;

  LoadSubscriptionSuccess({@required this.subscription});
}

class LoadSubscriptionFailure {
  final String error;

  LoadSubscriptionFailure({@required this.error});
}