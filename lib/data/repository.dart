import 'dart:async';
import 'dart:core';

import 'web_client.dart';

class Repository {
  final WebClient client;

  const Repository({this.client = const WebClient()});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, String> credentials = <String, String>{
      'username': email,
      'password': password,
    };

    return await client.post('/login/', credentials);
  }

  Future<Map<String, dynamic>> fetchCustomer(int id) async {
    return await client.get('/customers/$id/');
  }

  Future<List<dynamic>> fetchSubscription(int id) async {
    return await client.get('/consumersubscriptions/?customer=$id/');
  }

  Future<List<dynamic>> fetchPickups(int id) async {
    return await client.get('/pickups/?subscription=$id/');
  }
}