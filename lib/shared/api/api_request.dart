import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiRequest {

  static final String url = 'https://10.0.2.2:7001/api/';
  static final Map<String, String> headers = {"content-type": "application/json"};

  static Future<Response> post(params, String endpoint) async {
    return await http.post(Uri.parse("$url$endpoint"), body: json.encode(params), headers: headers).timeout(Duration(seconds: 10));
  }

}