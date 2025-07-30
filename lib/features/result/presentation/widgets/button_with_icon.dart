import 'package:flutter/material.dart';
import '../../../../core/reusable widgets/app_text.dart';
import '../../../../core/utils/media_query_values.dart';

class ButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBgColor;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;
  final String imagePath;
  const ButtonWithIcon({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.borderRadius,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonBgColor,
    required this.imagePath
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            height: MediaQueryValues.screenHeight * 0.038,
            width: MediaQueryValues.screenWidth * 0.06,
            padding: EdgeInsets.all(4),
            child: Image(image: AssetImage(imagePath),color: buttonTextColor,),
          ),
          // Space
          SizedBox(
            width: MediaQueryValues.screenWidth * 0.009,
          ),
          // Text
          AppText(
            textData: buttonText,
            fontWeight: FontWeight.w600,
            fontSize: 19,
            textColor: buttonTextColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
