/*
This modal is used for display filters
*/

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:provider/provider.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  // get screen size
  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  // Get random image based on project ID (consistent per project)
  String _getRandomImage(String projectId) {
    final images = [
      'assets/icons/Compass_fill@3x.png',
      'assets/icons/Fire@3x.png',
    ];
    // Use project ID hash to get consistent image per project
    final hash = projectId.hashCode;
    return images[hash.abs() % images.length];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsController>(
      builder: (context, projectsController, child) {
        final projects = projectsController.getProjects;
        final selectedProjectId = projectsController.selectedProjectId;

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
                // list of filters for transactions
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Layout.getHeight(context, 40),
                    ),
                  ),
                  // list of filters
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(Layout.getHeight(context, 25)),
                      // intro
                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 25),
                        ),
                        child: Text(
                          "Select to explore",
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

                      // "All Projects" option
                      InkWell(
                        onTap: () {
                          projectsController.setSelectedProject(null);
                          Navigator.of(context).pop();
                        },
                        child: transactionFilter(
                          context: context,
                          hasDivider: projects.isNotEmpty,
                          title: "All Projects",
                          textColor: Colors.black,
                          imagePath: 'assets/icons/Activities.png',
                          isSelected: selectedProjectId == null,
                        ),
                      ),

                      // List of projects
                      ...projects.asMap().entries.map((entry) {
                        final index = entry.key;
                        final project = entry.value;
                        final isLast = index == projects.length - 1;
                        final isSelected =
                            selectedProjectId == project.projectId;

                        return InkWell(
                          onTap: () {
                            projectsController.setSelectedProject(
                              project.projectId,
                            );
                            Navigator.of(context).pop();
                          },
                          child: transactionFilter(
                            context: context,
                            hasDivider: !isLast,
                            title: project.name,
                            textColor: Colors.black,
                            imagePath: _getRandomImage(project.projectId),
                            isSelected: isSelected,
                          ),
                        );
                      }),

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
}

Widget transactionFilter({
  required String title,
  required bool hasDivider,
  required Color textColor,
  double textSize = 14,
  required BuildContext context,
  required String imagePath,
  required bool isSelected,
}) {
  return Column(
    children: [
      Gap(Layout.getHeight(context, 22)),
      Padding(
        padding: EdgeInsets.only(left: Layout.getWidth(context, 25)),
        child: Row(
          children: [
            // right image
            Container(
              width: Layout.getWidth(context, 30),
              height: Layout.getHeight(context, 30),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, width: 20, height: 20),
              ),
            ),

            // text
            Gap(Layout.getWidth(context, 20)),
            Text(
              title,
              style: Styles.normalText(
                context,
              ).copyWith(color: textColor, fontSize: textSize),
            ),

            //
            const Spacer(),

            //
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Color(0xFFE8E8E8) : Color(0xFFE8E8E8),
                    width: 3,
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
