import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/network/models/project_modal.dart';
import 'package:deroli_mobile/network/utils/constants/apiUrls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export 'getProjects.dart';

Future<List<OptionItem>> getCategories({String? projectId}) async {
  try {
    final response = await http.post(
      Uri.parse(Constants.getProjects),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      }),
    );

    bool succefull = response.statusCode == 200;

    if (succefull) {
      print("succesfull");
      final responseData = jsonDecode(response.body);

      List<Project> projects = (responseData['projects'] as List? ?? [])
          .map((project) => Project.fromJson(project))
          .toList();

      // Extract categories - filter by projectId if provided
      List<Category> allCategories = [];
      for (var project in projects) {
        if (projectId == null || project.projectId == projectId) {
          allCategories.addAll(project.categories);
        }
      }

      // Convert Categories to OptionItem for InputTake component
      List<OptionItem> categoryOptions = allCategories.map((category) {
        // Format budget information for description
        String allocatedBudget = category.allocatedBudget;
        String balanceBudget = category.balanceBudget;

        // Format numbers (remove trailing zeros if decimal)
        try {
          double allocated = double.parse(allocatedBudget);
          double balance = double.parse(balanceBudget);
          allocatedBudget = allocated.toStringAsFixed(
            allocated == allocated.toInt() ? 0 : 2,
          );
          balanceBudget = balance.toStringAsFixed(
            balance == balance.toInt() ? 0 : 2,
          );
        } catch (e) {
          // Keep original if parsing fails
        }

        String description =
            'Allocated: $allocatedBudget | Balance: $balanceBudget';

        // Show sub-projects if available
        if (category.subProjects.isNotEmpty) {
          description += ' | Sub-projects: ${category.subProjects.length}';
        }

        return OptionItem(label: category.name, description: description);
      }).toList();

      return categoryOptions;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
