import 'package:deroli_mobile/components/general/activities/activity_notification.dart';
import 'package:deroli_mobile/components/general/dashed_border.dart';
import 'package:deroli_mobile/utils/index.dart';
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

              child: Column(
                children: [
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
                  ActivityNotification(),
                  DashedBorder(color: Color(0xFFDEDEDE)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
