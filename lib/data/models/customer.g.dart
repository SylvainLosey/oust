// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
      id: json['id'] as int,
      postcode: json['postcode'] as int,
      customerStatus: json['customer_status'] as String,
      company: json['company'],
      gender: json['gender'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      preferedCommunication: json['prefered_communication'] as String,
      preferedPaymentMethod: json['prefered_payment_method'] as String,
      user: json['bexio_id'] as int);
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'customer_status': instance.customerStatus,
      'company': instance.company,
      'gender': instance.gender,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address': instance.address,
      'postcode': instance.postcode,
      'city': instance.city,
      'prefered_communication': instance.preferedCommunication,
      'prefered_payment_method': instance.preferedPaymentMethod,
      'bexio_id': instance.user
    };
