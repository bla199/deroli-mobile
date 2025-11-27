import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:deroli_mobile/utils/index.dart';
export 'dashed_border.dart';

class DashedBorder extends StatelessWidget {
  final List<double> dashPattern;
  final double strokeWidth;
  const DashedBorder({
    super.key,
    required this.color,
    this.dashPattern = const [3, 4],
    this.strokeWidth = 0.8,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Layout.getWidth(context, 8),
          vertical: Layout.getHeight(context, 0),
        ),
        child: DottedBorder(
          dashPattern: dashPattern,
          customPath: (size) {
            // Draw only the bottom border
            return Path()
              ..moveTo(0, size.height)
              ..lineTo(size.width, size.height);
          },
          color: Color(0xFFE7E7E7),
          strokeWidth: strokeWidth,
          child: Row(),
        ),
      ),
    );
  }
}
