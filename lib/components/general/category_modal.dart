/*
Category and Subcategory Selection Modal
*/

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final String? projectId;
  final Function(String categoryName, String description)? onCategorySelected;

  const CategoryModal({super.key, this.projectId, this.onCategorySelected});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  Category? selectedCategory;
  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  List<Category> _getCategories() {
    final projectsController = Provider.of<ProjectsController>(
      context,
      listen: false,
    );

    if (widget.projectId == null) {
      // Get all categories from all projects
      return projectsController.getProjects
          .expand((project) => project.categories)
          .toList();
    }

    // Get categories from selected project
    final project = projectsController.getProjects.firstWhere(
      (p) => p.projectId == widget.projectId,
      orElse: () => projectsController.getProjects.first,
    );

    return project.categories;
  }

  String _formatBudget(String budget) {
    try {
      final value = double.parse(budget);
      return value.toStringAsFixed(value == value.toInt() ? 0 : 2);
    } catch (e) {
      return budget;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = _getCategories();

    return Consumer<ProjectsController>(
      builder: (context, projectsController, child) {
        return Container(
          width: screenSize.width * 0.87,
          margin: EdgeInsets.only(bottom: Layout.getWidth(context, 80)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Layout.getHeight(context, 15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Layout.getHeight(context, 40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Layout.getHeight(context, 25)),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 25),
                        ),
                        child: Text(
                          selectedCategory == null
                              ? "Select Category"
                              : "Select Subcategory",
                          style: Styles.normalText(context).copyWith(
                            color: Colors.black,
                            fontSize: Layout.getHeight(context, 14),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Gap(Layout.getHeight(context, 25)),
                      Divider(
                        height: Layout.getHeight(context, 0.5),
                        color: const Color(0xFFEBEBEB),
                      ),

                      // Show categories if none selected
                      if (selectedCategory == null)
                        ...categories.asMap().entries.map((entry) {
                          final index = entry.key;
                          final category = entry.value;
                          final isLast = index == categories.length - 1;
                          final hasSubProjects =
                              category.subProjects.isNotEmpty;

                          return InkWell(
                            onTap: () {
                              if (hasSubProjects) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              } else {
                                // No subcategories, select category directly
                                final description =
                                    'Allocated: ${_formatBudget(category.allocatedBudget)} | Balance: ${_formatBudget(category.balanceBudget)}';
                                widget.onCategorySelected?.call(
                                  category.name,
                                  description,
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            child: _categoryItem(
                              context: context,
                              title: category.name,
                              description:
                                  'Allocated: ${_formatBudget(category.allocatedBudget)} | Balance: ${_formatBudget(category.balanceBudget)}',
                              hasDivider: !isLast,
                              hasSubProjects: hasSubProjects,
                            ),
                          );
                        }).toList(),

                      // Show subcategories if category selected
                      if (selectedCategory != null) ...[
                        // Back button
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = null;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Layout.getWidth(context, 25),
                              top: Layout.getHeight(context, 15),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  size: Layout.getHeight(context, 20),
                                  color: Colors.black54,
                                ),
                                SizedBox(width: Layout.getWidth(context, 10)),
                                Text(
                                  "Back to Categories",
                                  style: TextStyle(
                                    fontSize: Layout.getHeight(context, 12),
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(Layout.getHeight(context, 15)),
                        Divider(
                          height: Layout.getHeight(context, 0.5),
                          color: const Color(0xFFEBEBEB),
                        ),

                        // Subcategories list
                        if (selectedCategory!.subProjects.isNotEmpty)
                          ...selectedCategory!.subProjects.asMap().entries.map((
                            entry,
                          ) {
                            final index = entry.key;
                            final isLast =
                                index ==
                                selectedCategory!.subProjects.length - 1;

                            return InkWell(
                              onTap: () {
                                final description =
                                    '${selectedCategory!.name} - Subcategory';
                                widget.onCategorySelected?.call(
                                  selectedCategory!.name,
                                  description,
                                );
                                Navigator.of(context).pop();
                              },
                              child: _categoryItem(
                                context: context,
                                title: "Subcategory ${index + 1}",
                                description: selectedCategory!.name,
                                hasDivider: !isLast,
                                hasSubProjects: false,
                              ),
                            );
                          }).toList()
                        else
                          Padding(
                            padding: EdgeInsets.all(
                              Layout.getHeight(context, 20),
                            ),
                            child: Center(
                              child: Text(
                                "No subcategories available",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 12),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                      ],

                      Gap(Layout.getHeight(context, 10)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _categoryItem({
    required BuildContext context,
    required String title,
    required String description,
    required bool hasDivider,
    required bool hasSubProjects,
  }) {
    return Column(
      children: [
        Gap(Layout.getHeight(context, 22)),
        Padding(
          padding: EdgeInsets.only(left: Layout.getWidth(context, 25)),
          child: Row(
            children: [
              Container(
                width: Layout.getWidth(context, 30),
                height: Layout.getHeight(context, 30),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.folder, size: 20, color: Color(0xFF3F2FBB)),
                ),
              ),
              Gap(Layout.getWidth(context, 20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Styles.normalText(context).copyWith(
                        color: Colors.black,
                        fontSize: Layout.getHeight(context, 14),
                      ),
                    ),
                    if (description.isNotEmpty)
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: Layout.getHeight(context, 11),
                        ),
                      ),
                  ],
                ),
              ),
              if (hasSubProjects)
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.chevron_right, color: Colors.black54),
                ),
            ],
          ),
        ),
        Gap(Layout.getHeight(context, 22)),
        hasDivider
            ? Divider(
                height: Layout.getHeight(context, 0.5),
                color: const Color(0xFFEBEBEB),
              )
            : Container(),
      ],
    );
  }
}
