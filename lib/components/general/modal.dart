/*
This is a bottom modal sheet
For display app modals
*/

import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      filter: ColorFilter.mode(blurColor, BlendMode.srcIn),
      child: child,
    ),
  );
}

Widget loadingModal(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoActivityIndicator(
          radius: Layout.getHeight(context, 15),
          color: const Color(0xFF312684),
        ),
        Gap(Layout.getHeight(context, 20)),
        Text(
          'Please wait...',
          textAlign: TextAlign.center,
          style: Styles.normalText(context).copyWith(color: Colors.black),
        ),
        // other widgets if needed
      ],
    ),
  );
}
