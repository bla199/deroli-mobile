import 'package:flutter/material.dart';
export 'border.dart';

class AppBorder extends StatelessWidget {
  const AppBorder({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: color)),
      ),
    );
  }
}
