/*
This is a bottom modal sheet
For display app modals
*/

import 'package:flutter/material.dart';

Future bottomModal({
  required Widget child,
  required BuildContext context,
  required Color blurColor,
  isScrollControlled = true,
  isDismissible = true,
  enableDrag = true,
}) {
  return showModalBottomSheet(
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => BackdropFilter(
      filter: ColorFilter.mode(
        blurColor,
        BlendMode.srcIn,
      ),
      child: child,
    ),
  );
}
