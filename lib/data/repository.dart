import 'dart:async';
import 'dart:core';

import 'web_client.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, String> credentials = <String, String>{
      'email': email,
      'password': password,
    };

    return await client.post('/auth/login/', credentials);
  }

  Future<List<dynamic>> fetchCustomer(int id) async {
    return await client.get('/customers/?user=$id/');
  }

  Future<List<dynamic>> fetchSubscription(int id) async {
    return await client.get('/subscriptions/?customer=$id/');
  }

  Future<List<dynamic>> fetchConsumerSubscription(int id) async {
    return await client.get('/consumersubscriptions/?customer=$id/');
  }

  Future<dynamic> fetchPackages() async {
    return await client.get('/packages/');
  }

  Future<List<dynamic>> fetchPickups(int id) async {
    return await client.get('/pickups/?subscription=$id/');
  }
}