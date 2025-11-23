/*
A component for returning back, with a cicle 
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:deroli_mobile/utils/index.dart';

class BackArrow extends StatelessWidget {
  final BuildContext context;
  final Color color;
  const BackArrow({
    super.key,
    required this.context,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },

      // add border with a radious
      child: Icon(
        EvaIcons.arrow_back,
        size: Layout.getHeight(context, 20),
        color: color,
      ),
    );
  }
}
