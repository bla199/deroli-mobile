import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/services/getVendor.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/components/general/category_modal.dart';
import 'package:deroli_mobile/components/general/modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../models/project_modal.dart';
import 'package:provider/provider.dart';

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

  // Convert projects from controller to OptionItem list
  List<OptionItem> _projectsToOptionItems(List<Project> projects) {
    maskedIdToProjectId.clear(); // Clear previous mappings

    return projects.map((project) {
      // Create label with masked project_id
      String projectId = project.projectId;
      String maskedId;
      if (projectId.length > 8) {
        String lastPart = projectId.substring(projectId.length - 8);
        maskedId = '********$lastPart';
      } else {
        maskedId = projectId;
      }

      // Store mapping
      maskedIdToProjectId[maskedId] = projectId;

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

      return OptionItem(label: description, description: maskedId);
    }).toList();
  }

  // Helper to get full project ID from masked ID
  String? _getFullProjectId(String maskedId) {
    return maskedIdToProjectId[maskedId];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: HeaderAppBar(
        title: "Request Money",
        isCentered: true,
        titleFontFamily: 'Fredoka',
        titleFontSize: 16,
        titleFontWeight: FontWeight.w600,
        backgroundColor: Color(0xFFF9F9F9),
        leading: BackArrow(context: context),
      ),

      body: Column(
        children: [
          Consumer<ProjectsController>(
            builder: (context, projectsController, child) {
              return InputTake(
                iconAsset: 'assets/icons/folder.png',
                title: "From - Project",
                label: "Select a project",
                // Use projects from controller
                fetchOptions: () async {
                  final projects = projectsController.getProjects;
                  return _projectsToOptionItems(projects);
                },
                onSelectionChanged: (label, description) {
                  // Label contains the masked project ID (e.g., "********48940f38")
                  // Get the full project ID
                  String? fullProjectId = _getFullProjectId(label);
                  setState(() {
                    selectedProjectId = fullProjectId;
                    selectedProjectLabel = label; // Masked project ID
                    selectedProjectDescription = description; // Categories
                  });
                },
              );
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

          Consumer<ProjectsController>(
            builder: (context, projectsController, child) {
              return InputTake(
                icon: Icons.attach_money,
                title: "Category",
                label:
                    selectedCategoryLabel ?? "Select category and sub-category",
                descrp: selectedCategoryDescription ?? "",
                onTap: () {
                  bottomModal(
                    context: context,
                    child: CategoryModal(
                      projectId: selectedProjectId,
                      onCategorySelected: (categoryName, description) {
                        setState(() {
                          selectedCategoryLabel = categoryName;
                          selectedCategoryDescription = description;
                        });
                      },
                    ),
                    blurColor: const Color.fromRGBO(212, 212, 212, 0.51),
                  );
                },
              );
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
