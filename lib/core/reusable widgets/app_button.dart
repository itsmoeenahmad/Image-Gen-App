import 'app_text.dart';
import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBgColor;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;
  const AppButton({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.borderRadius,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryValues.screenHeight * buttonHeight,
      width: MediaQueryValues.screenWidth * buttonWidth,
      decoration: BoxDecoration(
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: AppText(
          textData: buttonText,
          fontWeight: FontWeight.bold,
          fontSize: 17,
          textColor: buttonTextColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
