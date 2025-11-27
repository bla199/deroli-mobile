import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:http/http.dart' as http;
import 'package:deroli_mobile/utils/index.dart';
import 'dart:convert';
export 'get_vendors.dart';

Future<List<OptionItem>> projectPayment() async {
  try {
    final projectPayment = await http.post(
      Uri.parse(ApiUrls.projectPayment),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      }),
    );

    // print("Calling: ${Constants.getVendors}");
    // final response = jsonDecode(projectPayment.body);

    bool succefull = projectPayment.statusCode == 200;
    if (succefull) {
      print("succesfull");

      // List<Vendors> vendors = (response['vendors'] as List)
      //     .map((vendor) => Vendors.fromJson(vendor))
      //     .toList();

      // Convert Vendors to OptionItem for InputTake component
      // List<OptionItem> vendorOptions = vendors.map((vendor) {
      //   // Create description with account name and account number separated by |
      //   List<String> descriptionParts = [];
      //   if (vendor.account.isNotEmpty) {
      //     descriptionParts.add(vendor.account);
      //   }
      //   if (vendor.accountNumber.isNotEmpty) {
      //     descriptionParts.add(vendor.accountNumber);
      //   }
      //   String description = descriptionParts.join(' | ');

      //   return OptionItem(label: vendor.name, description: description);
      // }).toList();

      // return vendorOptions;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
