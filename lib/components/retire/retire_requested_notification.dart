import 'package:deroli_mobile/components/main.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
export 'retire_requested_Notification.dart';

class RetireRequestedNotification extends StatefulWidget {
  const RetireRequestedNotification({
    super.key,

    this.avatarColor,
    this.firstLetter,
    this.state,
    this.stateColor,
  });

  final Color? avatarColor;
  final String? firstLetter;
  final String? state;
  final Color? stateColor;
  @override
  State<RetireRequestedNotification> createState() =>
      _RetireRequestedNotificationState();
}

class _RetireRequestedNotificationState
    extends State<RetireRequestedNotification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          color: Color(0xFFBABABA),
          strokeWidth: 1,
          dashPattern: [3, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(10),
          padding: EdgeInsets.all(1),

          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFFEFE),

              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            spacing: 6,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          text: " 134832",
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
                                    DateTime.now().toString().substring(11, 16),

                                    style: TextStyle(color: Color(0xFF9A9A9A)),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Vendor",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Fen Marketing",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Payment For",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Transport",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "TZS 100,000",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Successful",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF1E971A),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                            ),
                                            child: Text("|"),
                                          ),
                                          Text(
                                            "Unretired",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFFFF7072),
                                            ),
                                          ),
                                        ],
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
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
