// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
      id: json['id'] as int,
      postcode: json['postcode'] as String,
      customerStatus: json['customer_status'] as String,
      company: json['company'],
      gender: json['gender'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      preferedCommunication: json['prefered_communication'] as String,
      preferedPaymentMethod: json['prefered_payment_method'] as String,
      bexioId: json['bexio_id'] as String,
      created: json['created'] as String,
      modified: json['modified'] as String,
      user: json['user'] as int);
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
      'bexio_id': instance.bexioId,
      'created': instance.created,
      'modified': instance.modified,
      'user': instance.user
    };
