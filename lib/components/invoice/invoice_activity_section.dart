import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';

class InvoiceActivitySection extends StatelessWidget {
  const InvoiceActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 12,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/File_dock.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Activity',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF787878),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const AppBorder(color: Color(0xFFEBEBEB)),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/checked_1.png',
                        height: 15,
                        width: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Created',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/Stroke_Frame.png',
                        height: 70,
                        width: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 5,
                          children: [
                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'By',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text(
                                    'Prosper Deroli',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "Oct 14, 2025",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        const WidgetSpan(
                                          child: SizedBox(width: 5),
                                        ),
                                        const TextSpan(
                                          text: '18:46',
                                          style: TextStyle(
                                            color: Color(0xFF9A9A9A),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'From',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text(
                                    'Kinondoni, MacBook Pro 20',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/checked_1.png',
                        height: 15,
                        width: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          bottom: 5,
                        ),
                        child: Text(
                          'Sent',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7A7A7A),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/Stroke_Frame.png',
                        height: 80,
                        width: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          spacing: 5,
                          children: [
                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'To',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text(
                                    'financial@jengo.co.tz',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "Oct 14, 2025",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        const WidgetSpan(
                                          child: SizedBox(width: 5),
                                        ),
                                        const TextSpan(
                                          text: '18:46',
                                          style: TextStyle(
                                            color: Color(0xFF9A9A9A),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 312,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787878),
                                    ),
                                  ),
                                  Text(
                                    'Sent',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/loading_1.png',
                        height: 15,
                        width: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Payment Status',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7A7A7A),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          width: 310,
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF787878),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFAEF),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Text(
                                    'Not Paid',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFE3B644),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: SizedBox(
                          width: 310,
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF787878),
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "Oct 14, 2025",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    const WidgetSpan(
                                      child: SizedBox(width: 5),
                                    ),
                                    const TextSpan(
                                      text: '18:46',
                                      style: TextStyle(
                                        color: Color(0xFF9A9A9A),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

