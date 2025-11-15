import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:flutter/material.dart';
export 'requested_Notification.dart';

class RequestedNotification extends StatefulWidget {
  const RequestedNotification({
    super.key,
    required this.avatarColor,
    required this.firstLetter,
    required this.state,
    required this.stateColor,
  });

  final Color avatarColor;
  final String firstLetter;
  final String state;
  final Color stateColor;
  @override
  State<RequestedNotification> createState() => _RequestedNotificationState();
}

class _RequestedNotificationState extends State<RequestedNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundColor: widget.avatarColor,
                  child: Text(
                    widget.firstLetter,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "REQ: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: "134832 ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              '20:40',
                              style: TextStyle(color: Color(0xFF9A9A9A)),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Vendor: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Fen Marketing",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "TZS ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: "300,098",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("For - Transport"),
                            Column(
                              children: [
                                Text(
                                  widget.state,
                                  style: TextStyle(color: widget.stateColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            DashedBorder(color: Color(0xFFDEDEDE)),
          ],
        ),
      ),
    );
  }
}
