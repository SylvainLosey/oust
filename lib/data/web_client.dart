import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WebClient {
  // static String baseUrl = 'http://10.0.2.2:8000/api';
  // static String baseUrl = 'https://admin.oust.ch/api';

  // ANDROID
  // static String baseUrl = 'http://10.0.2.2:5000/api';

  // iOS
  static String baseUrl = 'http://localhost:5000/api';

  const WebClient();

  Future<dynamic> get(String path, {bool auth = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key');

    final Map<String, String> headers = <String, String>{'Authorization': 'Token $key'};
    http.Response response;
    if (auth == false) {
      response = await http.Client().get('$baseUrl$path');
    } else {
      response = await http.Client().get('$baseUrl$path', headers: headers);
    }

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