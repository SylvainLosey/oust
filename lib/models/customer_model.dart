class Customer {
  final int id;
  final String customerStatus;
  final String company;
  final String gender;
  final String firstName;
  final String lastName;
  final String address;
  final int postcode;
  final String city;
  final String preferedCommunication;
  final String preferedPaymentMethod;
  final DateTime created;
  final DateTime modified;

  Customer.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        customerStatus = parsedJson['customer_status'],
        company = parsedJson['company'],
        gender = parsedJson['gender'],
        firstName = parsedJson['first_name'],
        lastName = parsedJson['last_name'],
        address = parsedJson['address'],
        postcode = parsedJson['postcode'],
        city = parsedJson['city'],
        preferedCommunication = parsedJson['prefered_communication'],
        preferedPaymentMethod = parsedJson['prefered_payment_method'],
        created = DateTime.parse(parsedJson['created']),
        modified = DateTime.parse(parsedJson['modified']);

  @override
  String toString() =>
      '$lastName $firstName';
}