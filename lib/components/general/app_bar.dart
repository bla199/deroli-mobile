import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:deroli_mobile/utils/index.dart';

/* 
The main appbar for the app
 */

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double? leadingWidth;
  final double? toolbarHeight;
  final double? horizotalPadding;
  final double? topPadding;
  final bool? isCentered;
  final double? titleFontSize;
  final bool? isBold;
  final Color backgroundColor;
  HeaderAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.toolbarHeight,
    this.horizotalPadding,
    this.topPadding,
    this.isCentered,
    this.titleFontSize,
    this.isBold,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Layout.getWidth(context, horizotalPadding ?? 0),
        right: Layout.getWidth(context, horizotalPadding ?? 0),
        top: Layout.getHeight(context, topPadding ?? 5),
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        toolbarHeight: Layout.getHeight(context, toolbarHeight ?? 40),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: leading,
        leadingWidth: leadingWidth,
        title: AutoSizeText(
          title ?? "",
          style: isBold != null
              ? Styles.header(context).copyWith(
                  fontSize: Layout.getHeight(context, titleFontSize ?? 14),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
              : Styles.normalText(context).copyWith(
                  fontSize: Layout.getHeight(context, titleFontSize ?? 14),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
        ),
        centerTitle: isCentered ?? false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
