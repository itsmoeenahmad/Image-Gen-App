import 'package:flutter/material.dart';
import 'package:imagegen/features/result/domain/provider/download_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_routes.dart';
import 'package:imagegen/core/constants/app_colors.dart';
import 'package:imagegen/core/utils/media_query_values.dart';
import 'package:imagegen/core/reusable%20widgets/app_text.dart';
import 'package:imagegen/core/reusable%20widgets/app_button.dart';
import 'package:imagegen/core/reusable%20widgets/show_message.dart';
import 'package:imagegen/features/create%20image/domain/provider/create_image_provider.dart';


class CreateImageScreen extends StatefulWidget {
  const CreateImageScreen({super.key});

  @override
  State<CreateImageScreen> createState() => _CreateImageScreenState();
}

class _CreateImageScreenState extends State<CreateImageScreen> {
  // Controller
  final promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Create Image Provider Class Instance
    final createImageProviderInstance = Provider.of<CreateImageProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AppText(
          textData: 'Create Image',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          textColor: AppColors.textColor,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQueryValues.screenWidth * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Space
            SizedBox(height: MediaQueryValues.screenHeight * 0.02),
            // Supporting text
            AppText(
              textData: 'Enter a prompt',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              textColor: AppColors.textColor,
              textAlign: TextAlign.center,
            ),
            // Space
            SizedBox(height: MediaQueryValues.screenHeight * 0.01),
            // Textfield for entering the prompt
            Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AppColors.textColor.withOpacity(0.5),
                  selectionColor: AppColors.textColor.withOpacity(0.4),
                  selectionHandleColor: AppColors.textColor.withOpacity(0.4),
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: promptController,
                cursorColor: AppColors.textColor.withOpacity(0.5),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xff111111),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                maxLength: 250,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'e.g. A cat astronaut on the moon, cinematic, 4k',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xffA6A6A6),
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.textFieldBgColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.textFieldBgColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.textFieldBgColor),
                  ),
                  filled: true,
                  fillColor: AppColors.textFieldBgColor.withOpacity(0.4),
                ),
              ),
            ),
            // Space
            Spacer(),
            // button for calling the api to generate the image
            InkWell(
              onTap: ()async{
                if(promptController.text.isEmpty)
                  {
                    showMessage(context, 'Enter the prompt', AppColors.textColor, AppColors.textFieldBgColor);
                  }
                else{
                  // Calling the api to generate an image
                  createImageProviderInstance.generateImage(promptController.text.toString());
                  // Navigating to result screen
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.result,(routes)=>false);
                }
              },
              child: AppButton(
                buttonText: 'Generate',
                buttonTextColor: AppColors.whiteColor,
                borderRadius: 10,
                buttonHeight: 0.06,
                buttonWidth: 0.9,
                buttonBgColor: AppColors.secondaryColor,
              ),
            ),
            // Space
            SizedBox(height: MediaQueryValues.screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}
