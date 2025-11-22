import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/network/models/project_modal.dart';
import 'package:deroli_mobile/network/utils/constants/apiUrls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
export 'getProjects.dart';

Future<List<OptionItem>> getProjects() async {
  try {
    final getProjects = await http.post(
      Uri.parse(Constants.getProjects),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      }),
    );

    bool succefull = getProjects.statusCode == 200;

    if (succefull) {
      print("succesfull");
      final responseData = jsonDecode(getProjects.body);

      List<Project> projects = (responseData['projects'] as List? ?? [])
          .map((project) => Project.fromJson(project))
          .toList();

      // Convert Projects to OptionItem for InputTake component
      List<OptionItem> projectOptions = projects.map((project) {
        // Create label with masked project_id
        String projectId = project.projectId;
        String maskedId;
        if (projectId.length > 8) {
          String lastPart = projectId.substring(projectId.length - 8);
          maskedId = '********$lastPart';
        } else {
          maskedId = projectId;
        }
        String label = maskedId;

        // Create description with categories names
        List<String> descriptionParts = [];
        if (project.categories.isNotEmpty) {
          String categoriesList = project.categories
              .map((c) => c.name)
              .take(3)
              .join(', ');
          if (project.categories.length > 3) {
            categoriesList += '...';
          }
          descriptionParts.add(categoriesList);
        }
        String description = descriptionParts.join(' | ');

        return OptionItem(label: description, description: label);
      }).toList();

      return projectOptions;
    }

    return [];
  } catch (e) {
    print("Error: $e");
    return [];
  }
}
