/*
This function displays an app toast
*/

import 'package:drops/drops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deroli_mobile/utils/index.dart';

void toastFunct({
  required String message,
  required BuildContext context,
  required bool isSuccess,
}) {
  Drops.show(
    context,
    title: message,
    // subtitle: message,
    icon: isSuccess ? CupertinoIcons.smiley_fill : Icons.sentiment_dissatisfied,
    isDestructive: false,
    highContrastText: true,
    position: DropPosition.top,
    shape: DropShape.pill,
    titleTextStyle: Styles.normalText(context).copyWith(
      fontSize: Layout.getHeight(context, 14),
      fontWeight: FontWeight.w600,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),
    iconColor: isSuccess ? Colors.green : Colors.red,
  );
}
