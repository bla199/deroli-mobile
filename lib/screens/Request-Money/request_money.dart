import 'package:deroli_mobile/services/getCategories.dart';
import 'package:deroli_mobile/services/getVendor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../models/project_modal.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants/apiUrls.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key, required});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  String? selectedProjectId;
  Map<String, String> maskedIdToProjectId =
      {}; // Map masked ID to full project ID

  // Store selected values for passing to AmountPage
  String? selectedProjectLabel;
  String? selectedProjectDescription;
  String? selectedVendorLabel;
  String? selectedVendorDescription;
  String? selectedCategoryLabel;
  String? selectedCategoryDescription;

  // Helper to get full project ID from masked ID
  Future<String?> _getFullProjectId(String maskedId) async {
    if (maskedIdToProjectId.containsKey(maskedId)) {
      return maskedIdToProjectId[maskedId];
    }

    // Fetch projects and build the map
    try {
      final response = await http.post(
        Uri.parse(Constants.getProjects),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
          "user_id": "039eba798dd24601abca5a3260d4a67e",
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        List<Project> projects = (responseData['projects'] as List? ?? [])
            .map((project) => Project.fromJson(project))
            .toList();

        // Build map of masked IDs to full project IDs
        for (var project in projects) {
          String projectId = project.projectId;
          String masked;
          if (projectId.length > 8) {
            String lastPart = projectId.substring(projectId.length - 8);
            masked = '********$lastPart';
          } else {
            masked = projectId;
          }
          maskedIdToProjectId[masked] = projectId;
        }

        return maskedIdToProjectId[maskedId];
      }
    } catch (e) {
      print("Error fetching projects: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F9F9),
        centerTitle: true,
        title: PageTitle(text: "Request Money"),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: Column(
        children: [
          InputTake(
            iconAsset: 'assets/icons/folder.png',
            title: "From - Project",
            label: "Select a project",
            // Use fetchOptions to pull data from server when clicked
            fetchOptions: () async {
              return await getProjects();
            },
            onSelectionChanged: (label, description) async {
              // Label contains the masked project ID (e.g., "********48940f38")
              // Get the full project ID
              String? fullProjectId = await _getFullProjectId(label);
              setState(() {
                selectedProjectId = fullProjectId;
                selectedProjectLabel = label; // Masked project ID
                selectedProjectDescription = description; // Categories
              });
            },
          ),

          InputTake(
            icon: Icons.person,
            title: "Vendor",
            label: "Select vendor you want to pay",
            fetchOptions: () async {
              return await getVendor();
            },
            onSelectionChanged: (label, description) {
              setState(() {
                selectedVendorLabel = label; // Vendor name
                selectedVendorDescription =
                    description; // Account | Account Number
              });
            },
          ),

          InputTake(
            icon: Icons.attach_money,
            title: "Category",
            label: "Select category and sub-category",
            fetchOptions: () async {
              return await getCategories(projectId: selectedProjectId);
            },
            onSelectionChanged: (label, description) {
              setState(() {
                selectedCategoryLabel = label; // Category name
                selectedCategoryDescription = description; // Budget info
              });
            },
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(children: [Text("Payment Purpose")]),
                SizedBox(height: 8),
                GestureDetector(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    color: Colors.black26,
                    dashPattern: [4, 2],
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100.0,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/image.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              "Add an image of pdf file",
                              style: TextStyle(color: Color(0xFF6D6D6D)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: FilledButton(
          onPressed: () {
            context.push(
              "/amount",
              extra: {
                'projectLabel': selectedProjectLabel ?? '',
                'projectDescription': selectedProjectDescription ?? '',
                'vendorLabel': selectedVendorLabel ?? '',
                'vendorDescription': selectedVendorDescription ?? '',
                'categoryLabel': selectedCategoryLabel ?? '',
                'categoryDescription': selectedCategoryDescription ?? '',
              },
            );
          },
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xFF312684),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
