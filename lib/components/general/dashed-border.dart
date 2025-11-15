import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
export 'dashed-border.dart';

class DashedBorder extends StatelessWidget {
  const DashedBorder({super.key, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: DottedBorder(
          dashPattern: [2, 3],
          customPath: (size) {
            // Draw only the bottom border
            return Path()
              ..moveTo(0, size.height)
              ..lineTo(size.width, size.height);
          },
          color: Color(0xFFE7E7E7),
          child: Row(),
        ),
      ),
    );
  }
}
