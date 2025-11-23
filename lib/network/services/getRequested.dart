import 'package:deroli_mobile/network/models/requests_modal.dart';
import 'package:deroli_mobile/network/utils/constants/apiUrls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export 'getRequested.dart';

Future<List<Payment>> getRequested() async {
  try {
    final getRequested = await http.post(
      Uri.parse(Constants.getRequested),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      }),
    );

    bool succefull = getRequested.statusCode == 200;

    if (succefull) {
      print("succesfull");
      final responseData = jsonDecode(getRequested.body);
      print(responseData);

      // Parse the response - payments field contains the payment requests
      List<Payment> paymentList = [];

      if (responseData['payments'] != null) {
        paymentList = (responseData['payments'] as List? ?? [])
            .map((payment) => Payment.fromJson(payment))
            .toList();
      } else if (responseData is List) {
        // Fallback if response is directly a list
        paymentList = responseData
            .map((item) => Payment.fromJson(item))
            .toList();
      }

      return paymentList;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
