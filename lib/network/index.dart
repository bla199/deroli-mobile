/*
API requests for auth of user
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:deroli_mobile/utils/constants.dart';

// API url
const String apiUrl = Constants.apiUrl;

// https request for getting OTP to a specified phone number
Future serverRequest({
  required Map<String, dynamic> requestData,
  required String endpoint,
}) async {
  try {
    final uri = Uri.parse('$apiUrl$endpoint/');

    // api request
    debugPrint(requestData.toString());
    debugPrint(uri.toString());
    final response = await http.post(
      uri,
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    // return data
    late Map<String, dynamic> data = {};
    if (response.statusCode != 500) {
      data = {
        "response": json.decode(response.body),
        "code": response.statusCode,
      };
    } else {
      data = {"response": {}, "code": response.statusCode};
    }
    // debugPrint(data.toString());
    return data;
  } on Exception catch (_) {
    // make it explicit that this function can throw exceptions
    rethrow;
  }
}
