import 'dart:async';
import 'dart:core';

import 'web_client.dart';
import 'models/customer.dart';
import 'models/subscription.dart';
import 'models/consumer_subscription.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, String> credentials = <String, String>{
      'email': email,
      'password': password,
    };

    return await client.post('/auth/login/', credentials, auth: false);
  }

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    final Map<String, String> data = <String, String>{
      'email': email,
      'password1': password,
      'password2': password,
    };

    return await client.post('/auth/registration/', data, auth: false);
  }

  Future<List<dynamic>> fetchCustomer(int id) async {
    return await client.get('/customers/?user=$id/');
  }

  Future<Map<String, dynamic>> createCustomer(Customer customer) async {
    return await client.post('/customers/', customer.toJson());
  }


  Future<List<dynamic>> fetchSubscription(int id) async {
    return await client.get('/subscriptions/?customer=$id/');
  }

  Future<Map<String, dynamic>> createSubscription(Subscription subscription) async {
    return await client.post('/subscriptions/', subscription.toJson());
  }


  Future<List<dynamic>> fetchConsumerSubscription(int id) async {
    return await client.get('/consumersubscriptions/?customer=$id/');
  }

  Future<Map<String, dynamic>> createConsumerSubscription(ConsumerSubscription consumerSubscription) async {
    return await client.post('/consumersubscriptions/', consumerSubscription.toJson());
  }


  Future<List<dynamic>> fetchPackages() async {
    return await client.get('/packages/', auth: false);
  }

  Future<List<dynamic>> fetchPickups(int id) async {
    return await client.get('/pickups/?subscription=$id/');
  }

  Future<List<dynamic>> fetchPostcodes() async {
    return await client.get('/postcodes/', auth: false);
  }

  Future<Map<String, dynamic>> postLead({String firstName, String lastName, String address, int postcode, String email, String phoneNumber, String contactMethod, String status}) async {
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
    };

    return await client.post('/leads/', body, auth: false);
  }

  Future<dynamic> fetchStartDates({String address, int postcode, int frequency}) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'address': address,
      'postcode_id': postcode,
      'frequency': frequency
    };

    return await client.post('/subscriptions/available_start_dates/', body, auth: false);
  }
}