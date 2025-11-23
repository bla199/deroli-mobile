import 'package:flutter/material.dart';
import 'package:deroli_mobile/utils/layout.dart';
import 'package:google_fonts/google_fonts.dart';

/*
Main styles of the app are defined in that class
*/

class Styles {
  // basic colors
  static Color lightBlue = const Color(0xFFEBF2FA);
  static Color greyColor = const Color(0xFF969696);
  static Color lightGrey = const Color(0xFF9A9A9A);
  static Color textGrey = const Color(0xFF9A9A9A);
  static Color green = const Color(0xFF00BA07);
  static Color lightGreen = const Color(0xFFEAFFEE);
  static Color lightGreenSuccess = const Color(0xFFCFFDD0);
  static Color lightGreenOne = const Color(0xFFF3FFDB);
  static Color greenVerified = const Color(0xFFF3FFDB);
  static Color dissabled = const Color(0xFFE7E7E7);
  static Color lightBlueInput = const Color(0xFFEDF1FF);
  static Color pendingColor = const Color(0xFFFFC44D);
  static Color lightGreyText = const Color(0xFFBBBBBB);

  // app basic styles
  static TextStyle normalText(BuildContext context) {
    return GoogleFonts.ibmPlexSans(fontSize: Layout.getHeight(context, 13));
  }

  static TextStyle header(BuildContext context) {
    return GoogleFonts.fredoka(
      fontSize: Layout.getHeight(context, 25),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headerMain(BuildContext context) {
    return GoogleFonts.fredoka(
      fontSize: Layout.getHeight(context, 15),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle fainted(BuildContext context) {
    return GoogleFonts.fredoka(
      fontSize: Layout.getHeight(context, 12),
      fontWeight: FontWeight.w100,
      color: Styles.greyColor,
    );
  }
}
