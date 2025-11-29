import 'package:deroli_mobile/models/Invoice_modal.dart';
import 'package:deroli_mobile/network/utils/constants/apiUrls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Object>> getInvoices() async {
  try {
    final getInvoices = await http.post(
      Uri.parse(Constants.getInvoices),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
      }),
    );

    bool succefull = getInvoices.statusCode == 200;

    if (succefull) {
      print("succesfull");
      final responseData = jsonDecode(getInvoices.body);
      print(responseData);

      List<Invoice> invoices = (responseData['invoices'] as List? ?? [])
          .map((invoice) => Invoice.fromJson(invoice))
          .toList();

      return invoices;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
