import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WebClient {
  // static String baseUrl = 'http://10.0.2.2:8000/api';
  static String baseUrl = 'https://admin.oust.ch/api';

  const WebClient();

  Future<dynamic> get(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    final Map<String, String> headers = {'Authorization': 'Token $token'};
    final http.Response response = await http.Client().get('$baseUrl$path', headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('An error occured: ' + response.body);
    }
  }

    Future<dynamic> post(String path, Map<String, dynamic> data) async {
    final http.Response response = await http.Client().post(
      '$baseUrl$path',
      body: data,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('An error occured: ' + response.body);
    }
  }

}