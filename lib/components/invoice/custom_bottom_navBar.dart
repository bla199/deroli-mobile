import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InvoiceCustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const InvoiceCustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DottedBorder(
            color: Color(0xFF7F7F7F),
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            dashPattern: [2, 3],

            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/Export_duotone.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Text("Send invoice", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),

          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: Color(0xFF312684),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/Done_ring_duotone.png',
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 10),
                Text("Mark as paid", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
