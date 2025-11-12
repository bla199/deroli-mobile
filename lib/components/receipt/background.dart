import 'package:flutter/material.dart';
export 'background.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE0DCFF).withOpacity(0.17),
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0DCFF).withOpacity(0.17)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
