// ignore_for_file: constant_pattern_never_matches_value_type, unreachable_switch_case

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:simple_test_practice/Data/Exceptions/Exception_test.dart';
import 'package:simple_test_practice/Data/Network/base_api_services.dart';

class NetworkServiceApi implements BaseApiServices {
  // 👉 GET API (Fetch Data)
  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers}) async {
    print("Network Get Api ;- " + url);
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));

      // Ensure we return the original Response object

      print("Network Get Risponse ;- " + response.body.toString());
      return returnResponse(response);
    } on SocketException {
      throw noInternetException('❌ No Internet Connection');
    } on TimeoutException {
      throw fetchDataExeption('❌ Request Timeout. Try Again.');
    } catch (e) {
      throw Exception("❌ Unknown Error in getApi: $e");
    }
  }

  // 👉 POST API (Create Data)
  @override
  Future<dynamic> postApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: headers ?? _defaultHeaders,
          )
          .timeout(const Duration(seconds: 20));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw noInternetException('No Internet Connection');
    } on TimeoutException {
      throw fetchDataExeption('Request Timeout. Try Again.');
    }
    return jsonResponse;
  }

  // 👉 Custom POST API for Contact (With Headers)
  Future<dynamic> contactpostApi(
    String url,
    Map<String, dynamic> data, {
    required Map<String, String> headers,
  }) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 20));

      final jsonResponse = returnResponse(response);

      // Ensure proper deserialization
      return jsonResponse;
    } on SocketException {
      throw noInternetException("❌ No Internet Connection");
    } catch (e) {
      throw Exception("❌ Unknown Error: $e");
    }
  }

  // 👉 PUT API (Update Data)
  Future<dynamic> putApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .put(
            Uri.parse(url),
            body: jsonEncode(data),
            headers: headers ?? _defaultHeaders,
          )
          .timeout(const Duration(seconds: 20));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw noInternetException('No Internet Connection');
    } on TimeoutException {
      throw fetchDataExeption('Request Timeout. Try Again.');
    }
    return jsonResponse;
  }

  // 👉 DELETE API (Delete Data)
  @override
  Future<http.Response> deleteApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.delete(Uri.parse(url), headers: headers);
      return response;
    } catch (e) {
      throw Exception('❌ Failed to connect to the server');
    }
  }

  // ✅ Handle API Responses
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 204:
        return jsonDecode(response.body);
      case 400:
        throw fetchDataExeption('❌ Bad Request: ${response.body}');
      case 401:
      case 403:
        throw unAuthorizedException('❌ Unauthorized Access');
      case 404:
        throw fetchDataExeption('❌ Resource Not Found: ${response.body}');
      case 500:
      default:
        throw fetchDataExeption(
          '❌ Error communicating with server (Status: ${response.statusCode})',
        );
    }
  }

  // ✅ Default Headers
  Map<String, String> get _defaultHeaders => {
    'Content-Type': 'application/json',
  };
}
