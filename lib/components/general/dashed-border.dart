import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
export 'dashed-border.dart';

class DashedBorder extends StatelessWidget {
  const DashedBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: DottedBorder(
          dashPattern: [4, 2],
          customPath: (size) {
            // Draw only the bottom border
            return Path()
              ..moveTo(0, size.height)
              ..lineTo(size.width, size.height);
          },
          color: Colors.black26,
          child: Row(),
        ),
      ),
    );
  }
}
