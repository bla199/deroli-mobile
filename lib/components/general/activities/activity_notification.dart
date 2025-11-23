import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
export 'activity_notification.dart';

class ActivityNotification extends StatefulWidget {
  const ActivityNotification({super.key});

  @override
  State<ActivityNotification> createState() => _ActivityNotificationState();
}

class _ActivityNotificationState extends State<ActivityNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Layout.getHeight(context, 15)),
      child: Column(
        mainAxisSize: MainAxisSize.max,

        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Layout.getWidth(context, 13),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Layout.getWidth(context, 35),
                  height: Layout.getHeight(context, 35),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Not_doc.png', width: 15),
                    iconSize: Layout.getHeight(context, 3),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFFEAE7FF), width: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Layout.getWidth(context, 10)),
                  child: SizedBox(
                    width: Layout.getWidth(context, 280),
                    child: Column(
                      spacing: Layout.getHeight(context, 1),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invoice INV-000071",
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                              ),
                            ),
                            Text(
                              "Nov 7, 2025",
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Text(
                                      "TZS",
                                      style: TextStyle(
                                        fontSize: Layout.getHeight(context, 12),
                                        color: Colors.black38,
                                      ),
                                    ),
                                    baseline: TextBaseline.alphabetic,
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: Layout.getWidth(context, 8),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "200,000",
                                    style: TextStyle(
                                      fontFamily: 'FredokaBold',
                                      // fontWeight: FontWeight.w600,
                                      fontSize: Layout.getHeight(context, 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "21:00",
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                                color: Colors.black26,
                              ),
                            ),
                            // Text("Nov 7, 2025"),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "Overdue",
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
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
    );
  }
}
