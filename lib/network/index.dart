import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deroli_mobile/network/utils/constants.dart';

const String apiUrl = Constants.apiUrl;

//request for getting OTP to a specific phone number

Future serverRequest({
  required Map<String, dynamic> requestData,
  required String endpoint,
}) async {
  try {
    final uri = Uri.parse('');

    final response = await http.post(
      uri,
      body: json.encode(requestData),
      headers: {'content-type': 'application/json'},
    );

    //return

    late Map<String, dynamic> data = {};
    if (response.statusCode != 500) {
      data = {
        "response": json.decode(response.body),
        "code": response.statusCode,
      };
    } else {
      data = {"response": {}, "code": response.statusCode};
    }

    return data;
  } on Exception catch (_) {
    rethrow;
  }
}
