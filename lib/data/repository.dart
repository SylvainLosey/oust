import 'dart:async';
import 'dart:core';

import 'web_client.dart';
import 'models/customer.dart';
import 'models/subscription.dart';
import 'models/pickup.dart';
import 'models/consumer_subscription.dart';
import 'models/phone_number.dart';
import 'models/email.dart';
import 'models/invoice_item.dart';
import 'models/lift.dart';
import 'models/lift_image.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  // AUTH
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, String> credentials = <String, String>{
      'email': email,
      'password': password,
    };

    return await client.post('/auth/login/', body: credentials, auth: false);
  }

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    final Map<String, String> data = <String, String>{
      'email': email,
      'password1': password,
      'password2': password,
    };

    return await client.post('/auth/registration/', body: data, auth: false);
  }

  Future<Map<String, dynamic>> storeFCMToken({int userId, String registrationID, String type}) async {
    final Map<String, dynamic> body = {'user': userId, 'registration_id': registrationID, 'type': type};
    return await client.post('/devices/', body: body);
  }

  dynamic deleteFCMToken({String registrationID}) async {
    return await client.delete('/devices/$registrationID/');
  }

  // CUSTOMER
  Future<List<dynamic>> fetchCustomer(int id) async {
    return await client.get('/customers/?user=$id/');
  }

  Future<Map<String, dynamic>> createCustomer(Customer customer) async {
    return await client.post('/customers/', body: customer.toJson());
  }

  // PHONE NUMBERS
  Future<List<dynamic>> fetchPhoneNumbers(int id) async {
    return await client.get('/phonenumbers/?customer=$id/');
  }

  Future<Map<String, dynamic>> createPhoneNumber(PhoneNumber phoneNumber) async {
    return await client.post('/phonenumbers/', body: phoneNumber.toJson());
  }

  // EMAILS
  Future<List<dynamic>> fetchEmails(int id) async {
    return await client.get('/emails/?customer=$id/');
  }

  Future<Map<String, dynamic>> createEmail(Email email) async {
    return await client.post('/emails/', body: email.toJson());
  }

  // SUBSCRIPTION
  Future<List<dynamic>> fetchSubscription(int id) async {
    return await client.get('/subscriptions/?customer=$id/');
  }

  Future<Map<String, dynamic>> createSubscription(Subscription subscription) async {
    return await client.post('/subscriptions/', body: subscription.toJson());
  }

  // CONSUMERSUBSCRIPTION
  Future<List<dynamic>> fetchConsumerSubscription(int id) async {
    return await client.get('/consumersubscriptions/?customer=$id/');
  }

  Future<Map<String, dynamic>> createConsumerSubscription(ConsumerSubscription consumerSubscription) async {
    return await client.post('/consumersubscriptions/', body: consumerSubscription.toJson());
  }

  // INVOICES
  Future<List<dynamic>> fetchInvoices(int customerId) async {
    return await client.get('/invoices/?customer=$customerId');
  }

  // INVOICE ITEMS
  Future<List<dynamic>> fetchInvoiceItems(int customerId) async {
    return await client.get('/invoiceitems/?customer=$customerId');
  }

  Future<Map<String, dynamic>> createInvoiceItem(InvoiceItem invoiceItem) async {
    return await client.post('/invoiceitems/', body: invoiceItem.toJson());
  }

  // PICKUPS
  Future<List<dynamic>> fetchPickups(int id) async {
    return await client.get('/pickups/?subscription=$id/');
  }

  Future<dynamic> updatePickup(Pickup pickup) async {
    return await client.patch('/pickups/${pickup.id}/', body: pickup.toJson());
  }

  Future<dynamic> deletePickup(int pickupId) async {
    return await client.delete('/pickups/$pickupId/');
  }

  Future<String> fetchPushBackDate(int pickupId) async {
    return await client.get('/pickups/$pickupId/push_back_date/');
  }

  Future<String> pushBackDate(int pickupId) async {
    return await client.post('/pickups/$pickupId/push_back/');
  }

  // LIFTS
  Future<List<dynamic>> fetchLifts(int customerId) async {
    return await client.get('/lifts/?customer=$customerId/');
  }

  Future<Map<String, dynamic>> createLift(Lift lift) async {
    return await client.post('/lifts/', body: lift.toJson());
  }

  Future<dynamic> updateLift(Lift lift) async {
    return await client.patch('/lifts/${lift.id}/', body: lift.toJson());
  }

  Future<List<dynamic>> fetchLiftImages(int customerId) async {
    return await client.get('/liftimages/?customer=$customerId/');
  }

  Future<Map<String, dynamic>> createLiftImage(LiftImage liftImage) async {
    return await client.post('/liftimages/', body: liftImage.toJson());
  }

  // POSTCODES
  Future<List<dynamic>> fetchPostcodes() async {
    return await client.get('/postcodes/', auth: false);
  }

  // PACKAGES
  Future<List<dynamic>> fetchPackages() async {
    return await client.get('/packages/', auth: false);
  }

  // GENERAL
  Future<Map<String, dynamic>> postLead(
      {String firstName,
      String lastName,
      String address,
      int postcode,
      String email,
      String phoneNumber,
      String contactMethod,
      String status,
      String service}) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'postcode': postcode.toString(),
      'email': email,
      'phone_number': phoneNumber,
      'contact_method': contactMethod,
      'status': status,
      'origin': 'app',
      'service': service
    };

    return await client.post('/leads/', body: body, auth: false);
  }

  Future<dynamic> fetchStartDates({String address, int postcode, int frequency}) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'address': address,
      'postcode_id': postcode,
      'frequency': frequency
    };

    return await client.post('/subscriptions/available_start_dates/', body: body, auth: false);
  }

  Future<dynamic> fetchLiftSlots(int liftId) async {
    return await client.get('/lifts/$liftId/available_lift_slots/');
  }
}
