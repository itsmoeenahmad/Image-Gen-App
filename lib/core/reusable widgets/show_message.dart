import 'package:flutter/material.dart';
import 'package:imagegen/core/reusable%20widgets/app_text.dart';

showMessage(context, String textIs,Color textColor, Color BgColor) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      content: AppText(
        textData: textIs,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        textColor: textColor,
        textAlign: TextAlign.center,
      ),
      backgroundColor: BgColor,
    ),
  );
}
