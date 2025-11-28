import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';

class InvoiceToSection extends StatelessWidget {
  const InvoiceToSection({super.key});

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
                            'assets/icons/Group.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Invoice To',
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
                spacing: 15,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vendor',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/circle_duotone.png',
                            width: 40,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'Fen Marketing Agency',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                        ),
                      ),
                      Text(
                        'financial@jengo.co.tz',
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
                        ' TIN ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                        ),
                      ),
                      Text(
                        '183-349-110',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF787878),
                        ),
                      ),
                      Text(
                        'South ursino, Street',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

