import 'package:deroli_mobile/components/general/modal.dart';
import 'package:deroli_mobile/screens/home/projects_modal.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectSelection extends StatefulWidget {
  const ProjectSelection({super.key});

  @override
  State<ProjectSelection> createState() => _ProjectSelectionState();
}

class _ProjectSelectionState extends State<ProjectSelection> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsController>(
      builder: (context, projectsController, child) {
        final selectedProject = projectsController.selectedProject;
        final displayName = selectedProject?.name ?? "All Projects";

        return InkWell(
          onTap: () {
            bottomModal(
              context: context,
              child: FilterModal(),
              blurColor: const Color.fromRGBO(212, 212, 212, 0.51),
            );
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Layout.getHeight(context, 30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.07),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Layout.getWidth(context, 20),
                vertical: Layout.getHeight(context, 10),
              ),
              margin: EdgeInsets.symmetric(
                vertical: Layout.getHeight(context, 30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: Layout.getWidth(context, 8),
                    ),
                    child: Image.asset(
                      'assets/icons/Activities.png',
                      width: Layout.getWidth(context, 15),
                    ),
                  ),
                  SizedBox(width: Layout.getWidth(context, 10)),
                  Text(
                    displayName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Layout.getHeight(context, 12),
                    ),
                  ),
                  SizedBox(width: Layout.getWidth(context, 6)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Layout.getWidth(context, 10),
                    ),
                    child: Image.asset(
                      'assets/icons/Arrow_Down.png',
                      width: Layout.getWidth(context, 14),
                      height: Layout.getHeight(context, 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
