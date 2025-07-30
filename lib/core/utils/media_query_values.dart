import 'package:flutter/cupertino.dart';

class MediaQueryValues {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static void initialize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }
}