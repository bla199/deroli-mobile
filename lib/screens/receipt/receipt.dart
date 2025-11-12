import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../components/main.dart';
import 'package:dotted_border/dotted_border.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
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
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),

                child: Stack(
                  children: [
                    Container(
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
                                    Image.asset('assets/images/image1.png'),
                                    SizedBox(height: 30),
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
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: "40,000",
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
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
                                                      ),
                                                    ),
                                                    Text("Ndondo cup"),
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
                                                      ),
                                                    ),
                                                    Text("Transport"),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Sub-category",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                    Text("Admin Fees"),
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
                                                      ),
                                                    ),
                                                    Text(
                                                      "Jan 12, 2025 04:25 PM",
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
                onPressed: () {},
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
