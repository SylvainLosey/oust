import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer{
    int id;

    @JsonKey(name: 'customer_status')
    String customerStatus;

    dynamic company;
    String gender;

    @JsonKey(name: 'first_name')
    String firstName;

    @JsonKey(name: 'last_name')
    String lastName;

    String address;
    
    String postcode;

    String city;

    @JsonKey(name: 'prefered_communication')
    String preferedCommunication;

    @JsonKey(name: 'prefered_payment_method')
    String preferedPaymentMethod;

    @JsonKey(name: 'bexio_id')
    String bexioId;

    String created;

    String modified;

    int user;

    Customer({
        this.id,
        this.postcode,
        this.customerStatus,
        this.company,
        this.gender,
        this.firstName,
        this.lastName,
        this.address,
        this.city,
        this.preferedCommunication,
        this.preferedPaymentMethod,
        this.bexioId,
        this.created,
        this.modified,
        this.user,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
    Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
