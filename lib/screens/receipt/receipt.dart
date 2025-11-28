import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';

class Receipt extends StatefulWidget {
  final String projectLabel;
  final String projectDescription;
  final String vendorLabel;
  final String vendorDescription;
  final String categoryLabel;
  final String categoryDescription;
  final String amount;

  const Receipt({
    super.key,
    this.projectLabel = '',
    this.projectDescription = '',
    this.vendorLabel = '',
    this.vendorDescription = '',
    this.categoryLabel = '',
    this.categoryDescription = '',
    this.amount = '0',
  });

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  final double circleRadius = 6.0;
  final double spacing = 8.0;

  // Helper that computes how many circles fit given the current context.
  int getCircleCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final totalWidth = circleRadius * 2 + spacing;
    return (screenWidth / totalWidth).floor();
  }

  // Format DateTime to readable string
  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = months[dateTime.month - 1];
    final day = dateTime.day.toString().padLeft(2, '0');
    final year = dateTime.year;
    final hour = dateTime.hour > 12
        ? dateTime.hour - 12
        : (dateTime.hour == 0 ? 12 : dateTime.hour);
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$month $day, $year $hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: HeaderAppBar(
        isCentered: true,
        titleFontFamily: 'Trap',
        titleFontSize: 15,
        titleFontWeight: FontWeight.w700,
        backgroundColor: Color(0xFFF9F9F9),
        leading: SizedBox(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),

                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(children: [Background(), Background()]),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 0,
                              ),
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      width: 250,
                                      child: Image.asset(
                                        'assets/icons/source.gif',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              "We have successfully sent the notification to admin ",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    text: "via ",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "proc@deroli.co.tz ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      TextSpan(text: "and"),
                                                      TextSpan(
                                                        text: " 0747696485",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 20),
                                            AppBorder(color: Color(0xFFE7E7E7)),
                                            SizedBox(height: 20),

                                            Column(
                                              spacing: 20,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Requested",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    widget
                                                                        .amount
                                                                        .isNotEmpty
                                                                    ? "${widget.amount} "
                                                                    : "0 ",
                                                                style: TextStyle(
                                                                  fontFamily:
                                                                      'Fredoka',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: "TZS",
                                                                style: TextStyle(
                                                                  fontSize: 8,

                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Project",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      widget.projectLabel,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Category",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      widget
                                                              .categoryLabel
                                                              .isNotEmpty
                                                          ? widget.categoryLabel
                                                          : "Category",
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Vendor",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      widget
                                                              .vendorLabel
                                                              .isNotEmpty
                                                          ? widget.vendorLabel
                                                          : "Vendor",
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Requested time",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      _formatDateTime(
                                                        DateTime.now(),
                                                      ),
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                DottedBorder(
                                                  dashPattern: [4, 2],
                                                  customPath: (size) {
                                                    // Draw only the bottom border
                                                    return Path()
                                                      ..moveTo(0, size.height)
                                                      ..lineTo(
                                                        size.width,
                                                        size.height,
                                                      );
                                                  },
                                                  color: Colors.black26,
                                                  child: Row(),
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "You will be notified once proccessed",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 00),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -12, // negative to hang half outside
                      left: 0,
                      right: 0,

                      child: Transform.translate(
                        offset: Offset(0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            getCircleCount(context),
                            (index) => Container(
                              width: circleRadius * 2,
                              height: circleRadius * 4,
                              decoration: BoxDecoration(
                                color: Color(0xFFF8F8F9),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF312684)),
                ),
                onPressed: () {
                  context.go("/activities");
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Go back home"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
