import 'package:deroli_mobile/network/models/Invoice_modal.dart';
import 'package:deroli_mobile/network/utils/constants/apiUrls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export 'getProjects.dart';

Future<List<Invoice>> getInvoices() async {
  try {
    final getInvoices = await http.post(
      Uri.parse(Constants.getInvoices),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
      }),
    );

    bool succefull = getInvoices.statusCode == 200;
    print("STATUS: ${getInvoices.statusCode}");
    print("Response data: ${getInvoices.body}");

    if (succefull) {
      final responseData = jsonDecode(getInvoices.body);

      if (responseData['invoices'] != null) {
        final invoices = (responseData['invoices'] as List)
            .map((invoice) => Invoice.fromJson(invoice))
            .toList();
        print("Parsed ${invoices.length} invoices");
        return invoices;
      } else if (responseData is List) {
        final invoices = responseData
            .map((invoice) => Invoice.fromJson(invoice))
            .toList();
        print("Parsed ${invoices.length} invoices from list");
        return invoices;
      } else {
        print("No invoices found in response");
        return [];
      }
    } else {
      print("Request failed with status: ${getInvoices.statusCode}");
      return [];
    }
  } catch (e, stackTrace) {
    print("Error in getInvoices: $e");
    print("Stack trace: $stackTrace");
    return [];
  }
}
