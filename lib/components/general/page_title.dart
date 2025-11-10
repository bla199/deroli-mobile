import 'package:flutter/material.dart';
export 'page_title.dart';

class PageTitle extends StatelessWidget {
  final String text;

  const PageTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Trap',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
