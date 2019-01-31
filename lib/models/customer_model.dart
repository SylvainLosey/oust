class Customer {
  final int id;
  final String customerType;
  final String customerStatus;
  final String gender;
  final String firstName;
  final String lastName;
  final String address;
  final int postcode;
  final String city;
  final String preferedCommunication;
  final String preferedPaymentMethod;
  final int leadOrigin;
  final int bexioId;
  final DateTime created;
  final DateTime modified;

  Customer.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        customerType = parsedJson['customer_type'],
        customerStatus = parsedJson['customer_status'],
        gender = parsedJson['gender'],
        firstName = parsedJson['first_name'],
        lastName = parsedJson['last_name'],
        address = parsedJson['address'],
        postcode = parsedJson['postcode'],
        city = parsedJson['city'],
        preferedCommunication = parsedJson['prefered_communication'],
        preferedPaymentMethod = parsedJson['prefered_payment_method'],
        leadOrigin = parsedJson['lead_origin'],
        bexioId = parsedJson['bexio_id'],
        created = parsedJson['created'],
        modified = parsedJson['modified'];

  @override
  String toString() =>
      '$lastName $firstName';
}