import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';

class InvoiceHeaderCard extends StatelessWidget {
  const InvoiceHeaderCard({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
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
                            'assets/icons/Send.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'INV:134832',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text.rich(
                    TextSpan(
                      text: "TZS ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9A9A9A),
                      ),
                      children: [
                        TextSpan(
                          text: ' 300,098',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
                bottom: 20,
              ),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Invoice created',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Today: 17:28",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Created by',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "CFO, Prosper Deroli",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 2,
                          ),
                          child: Text(
                            "Pending payment",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE3B644),
                            ),
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

