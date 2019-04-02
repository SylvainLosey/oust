import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/customer.dart';
import '../../data/models/user.dart';

part 'customer_actions.g.dart';

@JsonSerializable()
class LoadCustomerAction {
  final User user;

  LoadCustomerAction({@required this.user});

  Map<String, dynamic> toJson() => _$LoadCustomerActionToJson(this);
}

@JsonSerializable()
class LoadCustomerSuccess {
  final Customer customer;

  LoadCustomerSuccess({@required this.customer});

  Map<String, dynamic> toJson() => _$LoadCustomerSuccessToJson(this);

}

@JsonSerializable()
class LoadCustomerFailure {
  final String error;

  LoadCustomerFailure({@required this.error});

  Map<String, dynamic> toJson() => _$LoadCustomerFailureToJson(this);

}
