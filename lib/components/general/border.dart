import 'package:flutter/material.dart';
export 'border.dart';

class AppBorder extends StatelessWidget {
  const AppBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        border: const Border(bottom: BorderSide(color: Color(0xFFEFEFEF))),
      ),
    );
  }
}
