import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';

class InvoiceDetailsSection extends StatelessWidget {
  const InvoiceDetailsSection({super.key});

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
                            'assets/icons/Paper_alt_duotone_line.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Details',
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
            const SizedBox(height: 20),

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
                    children: [
                      const Text(
                        'Sent Date',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Aug 14, 2025",
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Due date',
                        style: TextStyle(
                          fontSize: 14,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

