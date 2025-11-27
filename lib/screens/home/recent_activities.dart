import 'package:deroli_mobile/components/general/activities/activity_notification.dart';
import 'package:deroli_mobile/components/general/dashed_border.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  List<Payment> _getRecentPayments(ProjectsController projectsController) {
    // Get projects based on selection
    List<Project> projectsToUse;
    if (projectsController.selectedProjectId == "") {
      // All projects
      projectsToUse = projectsController.getProjects;
    } else {
      // Selected project only
      final selectedProject = projectsController.selectedProject;
      projectsToUse = selectedProject != null ? [selectedProject] : [];
    }

    // Get all payments from selected projects
    final allPayments = projectsToUse
        .expand((project) => project.payments)
        .toList();

    // Sort payments by date (most recent first)
    allPayments.sort((a, b) {
      try {
        final dateA = DateTime.parse(a.paymentDate);
        final dateB = DateTime.parse(b.paymentDate);
        return dateB.compareTo(dateA); // Descending order (newest first)
      } catch (e) {
        // If date parsing fails, try using the 'date' field
        try {
          final dateA = DateTime.parse(a.date);
          final dateB = DateTime.parse(b.date);
          return dateB.compareTo(dateA);
        } catch (e2) {
          return 0; // Keep original order if both fail
        }
      }
    });

    // Return the most recent 3 payments
    return allPayments.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Layout.getHeight(context, 25)),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Activities",
                  style: TextStyle(fontSize: Layout.getHeight(context, 14)),
                ),
                Transform.rotate(
                  angle: 0.8,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/circle_duotone.png',
                      width: Layout.getWidth(context, 30),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(Layout.getHeight(context, 30)),
                ),
              ),

              child: Consumer<ProjectsController>(
                builder: (context, projectsController, child) {
                  final recentPayments = _getRecentPayments(projectsController);

                  if (recentPayments.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(Layout.getHeight(context, 30)),
                      child: Center(
                        child: Text(
                          "No recent activities",
                          style: TextStyle(
                            fontSize: Layout.getHeight(context, 14),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      ...recentPayments.asMap().entries.map((entry) {
                        final index = entry.key;
                        final payment = entry.value;
                        return Column(
                          children: [
                            ActivityNotification(payment: payment),
                            if (index < recentPayments.length - 1)
                              DashedBorder(color: Color(0xFFDEDEDE)),
                          ],
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.all(Layout.getHeight(context, 30)),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("View all activities"),
                              SizedBox(width: Layout.getWidth(context, 5)),
                              Image.asset(
                                'assets/icons/Arrow_Right.png',
                                width: Layout.getWidth(context, 13),
                                height: Layout.getHeight(context, 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
