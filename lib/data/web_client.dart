import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WebClient {
  // static String baseUrl = 'https://admin.oust.ch/api';

  // ANDROID
  // static String baseUrl = 'http://10.0.2.2:5000/api';

  // iOS Emulator
  // static String baseUrl = 'http://localhost:8000/api';
  // iOS Device
  static String baseUrl = 'http://192.168.1.106:5000/api';

  const WebClient();

  Future<dynamic> get(String path, {bool auth = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key');

    final Map<String, String> headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      if (auth) 'Authorization': 'Token $key',
    };

    final http.Response response = await http.Client().get('$baseUrl$path', headers: headers);

    if (response.statusCode == 200) {
      // DRF doesn't set application/json, charset=utf-8 otherwise just json.decode would work
      // Workaround is using bodyBytes, decoding to utf-8 and then to json
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(response.body);
    }
  }

  Future<dynamic> post(String path, {Map<String, dynamic> body = const {}, bool auth = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key');

    final Map<String, String> headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      if (auth) 'Authorization': 'Token $key',
    };

    final http.Response response = await http.post(
      '$baseUrl$path',
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> delete(String path, {bool auth = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key');

    final Map<String, String> headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      if (auth) 'Authorization': 'Token $key',
    };

    final http.Response response = await http.delete(
      '$baseUrl$path',
      headers: headers,
    );

    if (response.statusCode != 204) {
      throw Exception(response.body);
    }
  }

  Future<void> patch(String path, {Map<String, dynamic> body = const {}, bool auth = true}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key');

    final Map<String, String> headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
      if (auth) 'Authorization': 'Token $key',
    };

    final http.Response response = await http.patch(
      '$baseUrl$path',
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}
