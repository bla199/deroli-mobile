import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';

class InvoiceItemsSection extends StatelessWidget {
  const InvoiceItemsSection({super.key});

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
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 12,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/3d_box_fill.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Invoice For',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF787878),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Image.asset(
                        'assets/icons/circle_duotone.png',
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const AppBorder(color: Color(0xFFEBEBEB)),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4FF),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Item Name',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Unit Price',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flyers',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '6',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '10,000',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '60,000',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                    ],
                  ),

                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Docker',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '15,000',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '25,000',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DashedBorder(color: Color(0xFFEBEBEB)),

            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                      Text(
                        '160,000',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                      Text(
                        '16,000(10%)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                      Text(
                        '-18,000(18%)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF545454),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  DashedBorder(color: Color(0xFFEBEBEB)),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.0,
                      vertical: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.w900,
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5FF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Text(
                              '180,000',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  DashedBorder(color: Color(0xFFEBEBEB)),
                ],
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

