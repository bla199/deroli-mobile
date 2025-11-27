/* This is a class for a user 
to switch between branches */

import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/screens/home/projects_modal.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectModal extends StatefulWidget {
  final String type;
  const SelectModal({super.key, required this.type});

  @override
  State<SelectModal> createState() => _SelectModalState();
}

class _SelectModalState extends State<SelectModal> {
  late Size screenSize;

  @override
  void didChangeDependencies() {
    screenSize = Layout.getSize(context);
    super.didChangeDependencies();
  }

  // call branches function
  @override
  void initState() {
    super.initState();
  }

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
    // app state manager
    final projectsController = Provider.of<ProjectsController>(context);

    //This is the parent container with the gradient color
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        // container style
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Layout.getHeight(context, 40)),
            topRight: Radius.circular(Layout.getHeight(context, 40)),
          ),

          //gradient
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFE3F7), Color(0xFFFFF4FC), Color(0xFFDAECFF)],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(Layout.getHeight(context, 10)),
            // this is the middle container
            Container(
              width: screenSize.width * 0.15,
              height: Layout.getHeight(context, 5),
              decoration: BoxDecoration(
                color: Styles.greyColor,
                borderRadius: BorderRadius.circular(
                  Layout.getHeight(context, 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Layout.getWidth(context, 20),
                vertical: Layout.getHeight(context, 20),
              ),

              /* This is the white container for
              rendering the branches sections */
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Layout.getHeight(context, 20)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Layout.getWidth(context, 10),
                    vertical: Layout.getHeight(context, 10),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //
                      if (widget.type == 'project')
                        ...projectsController.getProjects.asMap().entries.map((
                          entry,
                        ) {
                          final index = entry.key;
                          final project = entry.value;
                          final isLast =
                              index ==
                              projectsController.getProjects.length - 1;
                          final isSelected =
                              projectsController
                                  .selectedPaymentProject
                                  .projectId ==
                              project.projectId;

                          return InkWell(
                            onTap: () {
                              projectsController.setSelectedPaymentProject(
                                project,
                              );
                              projectsController.setSelectedPaymentCategory(
                                Category(),
                              );
                              context.pop();
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

                      if (widget.type == 'category')
                        ...projectsController.selectedPaymentProject.categories
                            .asMap()
                            .entries
                            .map((entry) {
                              final index = entry.key;
                              final category = entry.value;
                              final isLast =
                                  index ==
                                  projectsController
                                          .selectedPaymentProject
                                          .categories
                                          .length -
                                      1;
                              final isSelected =
                                  projectsController
                                      .selectedPaymentCategory
                                      .categoryId ==
                                  category.categoryId;

                              return InkWell(
                                onTap: () {
                                  projectsController.setSelectedPaymentCategory(
                                    category,
                                  );
                                  context.pop();
                                },
                                child: transactionFilter(
                                  context: context,
                                  hasDivider: !isLast,
                                  title: category.name,
                                  textColor: Colors.black,
                                  imagePath: _getRandomImage(
                                    category.categoryId,
                                  ),
                                  isSelected: isSelected,
                                ),
                              );
                            }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
