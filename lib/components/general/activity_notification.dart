import 'package:flutter/material.dart';
export 'activity_notification.dart';
import 'package:dotted_border/dotted_border.dart';

class ActivityNotification extends StatefulWidget {
  const ActivityNotification({super.key});

  @override
  State<ActivityNotification> createState() => _ActivityNotificationState();
}

class _ActivityNotificationState extends State<ActivityNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.document_scanner, size: 17),
                  maxRadius: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 280,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invoice INV-000071",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("Nov 7, 2025", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: const Text(
                                      "TZS",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black26,
                                      ),
                                    ),
                                    baseline: TextBaseline.alphabetic,
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  const WidgetSpan(child: SizedBox(width: 8)),
                                  const TextSpan(
                                    text: "200,000",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              "21:00",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black26,
                              ),
                            ),
                            // Text("Nov 7, 2025"),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "overdue",
                              style: TextStyle(
                                fontSize: 12,
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
