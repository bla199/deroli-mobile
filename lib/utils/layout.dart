import 'package:flutter/material.dart';

/*
This class has functions for getting screen width and height,
For app responsiveness design
*/
class Layout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getHeight(BuildContext context, double pixels) {
    double x = getScreenHeight(context) / pixels;
    return getScreenHeight(context) / x;
  }

  static getWidth(BuildContext context, double pixels) {
    double x = getScreenWidth(context) / pixels;
    return getScreenWidth(context) / x;
  }
}
