import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/customer.dart';
import '../../data/models/phone_number.dart';
import '../../data/models/email.dart';
import '../../data/models/user.dart';

part 'customer_actions.g.dart';


// CUSTOMER

@JsonSerializable()
class LoadCustomerRequest {
  @JsonKey(fromJson: User.fromJson)
  final User user;

  LoadCustomerRequest({@required this.user});

  Map<String, dynamic> toJson() => _$LoadCustomerRequestToJson(this);
}

@JsonSerializable()
class LoadCustomerSuccess {
  @JsonKey(fromJson: Customer.fromJson)
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

// Reducer not yet created - Not sure if nexessary

@JsonSerializable()
class CreateCustomerRequest {
  final String firstName;
  final String lastName;
  final String address;
  final String preferedCommunication;
  final int postcode;
  final int userId;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateCustomerRequest({this.firstName, this.lastName, this.address, this.preferedCommunication, this.postcode, this.userId, this.completer});
  Map<String, dynamic> toJson() => _$CreateCustomerRequestToJson(this);
}

@JsonSerializable()
class CreateCustomerSuccess {
    Map<String, dynamic> toJson() => _$CreateCustomerSuccessToJson(this);
}

@JsonSerializable()
class CreateCustomerFailure {
  final String error;

  CreateCustomerFailure({this.error});
  Map<String, dynamic> toJson() => _$CreateCustomerFailureToJson(this);
}




// PHONE NUMBER
@JsonSerializable()
class LoadPhoneNumbersRequest{
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadPhoneNumbersRequest({this.customer});
  Map<String, dynamic> toJson() => _$LoadPhoneNumbersRequestToJson(this);
}

class LoadPhoneNumbersSuccess{
  final List<PhoneNumber> phoneNumbers;

  LoadPhoneNumbersSuccess({this.phoneNumbers});
  Map<String, dynamic> toJson() => null;
}

@JsonSerializable()
class LoadPhoneNumbersFailure{
  final String error;

  LoadPhoneNumbersFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadPhoneNumbersFailureToJson(this);
}


// EMAIL
@JsonSerializable()
class LoadEmailsRequest{
  @JsonKey(fromJson: Customer.fromJson) 
  final Customer customer;

  LoadEmailsRequest({this.customer});
  Map<String, dynamic> toJson() => _$LoadEmailsRequestToJson(this);
}

class LoadEmailsSuccess{
  final List<Email> emails;

  LoadEmailsSuccess({this.emails});
  Map<String, dynamic> toJson() => null;
}

@JsonSerializable()
class LoadEmailsFailure{
  final String error;

  LoadEmailsFailure({this.error});
  Map<String, dynamic> toJson() => _$LoadEmailsFailureToJson(this);
}
