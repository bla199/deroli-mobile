import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),

      //
      appBar: HeaderAppBar(
        title: "Select sub-category",
        isCentered: true,
        titleFontFamily: 'Trap',
        titleFontSize: 16,
        titleFontWeight: FontWeight.w600,
        backgroundColor: Color(0xFFF9F9F9),
        leading: BackArrow(context: context),
      ),

      //
      body: Consumer<ProjectsController>(
        builder: (context, projectsController, child) {
          // Get selected project
          final selectedProject = projectsController.selectedPaymentProject;
          final categories = selectedProject.categories;

          return ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              // Display each category with its subcategories
              ...categories.map((category) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Layout.getHeight(context, 22),
                    vertical: Layout.getHeight(context, 10),
                  ),
                  child: DottedBorder(
                    dashPattern: [4, 2],
                    color: const Color(0xFFEBEBEB),
                    strokeWidth: 2,
                    radius: Radius.circular(Layout.getHeight(context, 10)),
                    borderType: BorderType.RRect,
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Layout.getWidth(context, 13),
                        vertical: Layout.getHeight(context, 20),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Layout.getHeight(context, 10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: Styles.normalText(context).copyWith(
                              fontSize: Layout.getHeight(context, 14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          //
                          Gap(Layout.getHeight(context, 10)),
                          Divider(
                            height: Layout.getHeight(context, 0.5),
                            thickness: 0.5,
                            color: const Color(0xFFEBEBEB),
                          ),

                          //
                          Gap(Layout.getHeight(context, 15)),

                          // Display subcategories
                          ...category.subProjects.map((subProject) {
                            final isSelected =
                                projectsController
                                    .selectedPaymentSubProject
                                    .subProjectId ==
                                subProject.subProjectId;

                            return InkWell(
                              onTap: () {
                                projectsController.setSelectedPaymentCategory(
                                  category,
                                );
                                projectsController.setSelectedPaymentSubProject(
                                  subProject,
                                );
                                context.pop();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: Layout.getHeight(context, 13),
                                ),
                                child: Row(
                                  children: [
                                    Gap(Layout.getWidth(context, 13)),
                                    //
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? Color(0xFF3F2FBB)
                                              : Color(0xFFE8E8E8),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Center(
                                              child: Container(
                                                width: 9,
                                                height: 9,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(
                                                    0xFF3F2FBB, // inner dot
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                    ),

                                    //
                                    Gap(Layout.getWidth(context, 8)),
                                    Text(
                                      subProject.name,
                                      style: Styles.normalText(context)
                                          .copyWith(
                                            fontSize: Layout.getHeight(
                                              context,
                                              14,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
