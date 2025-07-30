import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String textData;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const AppText({
    super.key,
    required this.textData,
    required this.fontWeight,
    required this.fontSize,
    required this.textColor,
    required this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      textAlign: textAlign,
      style: GoogleFonts.plusJakartaSans(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
