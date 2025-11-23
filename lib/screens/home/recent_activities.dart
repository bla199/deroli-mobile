import 'package:deroli_mobile/components/general/activities/activity_notification.dart';
import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:flutter/material.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Activities"),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/circle_duotone.png',
                    width: 35,
                  ),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),

              child: Column(
                children: [
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View all activities"),
                          SizedBox(width: 5),
                          Image.asset(
                            'assets/icons/Arrow_Right.png',
                            width: 13,
                            height: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
