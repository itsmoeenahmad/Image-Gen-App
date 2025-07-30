import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/reusable widgets/app_text.dart';
import 'package:imagegen/core/constants/app_assets.dart';
import '../../domain/provider/download_image_provider.dart';
import 'package:imagegen/core/constants/app_colors.dart';
import '../../../../services/download image/download_image_service.dart';
import 'package:imagegen/features/create%20image/domain/provider/create_image_provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AppText(
          textData: 'Generated Image',
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
        child: Consumer<CreateImageProvider>(
          builder:
              (
                BuildContext context,
                createImageProviderInstance,
                Widget? child,
              ) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Space
                    SizedBox(height: MediaQueryValues.screenHeight * 0.02),
                    // Generated image
                    Container(
                      height: MediaQueryValues.screenHeight * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBgColor.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.textFieldBgColor),
                      ),
                      child: createImageProviderInstance.isLoading
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Supporting text
                                  AppText(
                                    textData: 'Generating your image',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    textColor: AppColors.textColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  AppText(
                                    textData:
                                        'This may take a few moments. Please wait...',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    textColor: AppColors.textColor.withOpacity(
                                      0.7,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  // Space
                                  SizedBox(
                                    height:
                                        MediaQueryValues.screenHeight * 0.04,
                                  ),
                                  // Loading
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQueryValues.screenWidth * 0.04,
                                    ),
                                    child: LinearProgressIndicator(
                                      color: AppColors.secondaryColor,
                                      backgroundColor:
                                          AppColors.textFieldBgColor,
                                      minHeight: 4,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(
                                  createImageProviderInstance.generatedImageURL,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    // Space
                    SizedBox(height: MediaQueryValues.screenHeight * 0.01),
                    // Space
                    Spacer(),
                    // Button - for download
                    Consumer<DownloadImageProvider>(
                      builder: (BuildContext context, downloadImageProviderInstance, Widget? child) {
                        return InkWell(
                          onTap: () async {
                            // Showing the loading
                            downloadImageProviderInstance.changeStatus();
                            // Downloading the image
                            await downloadImageIOS(
                              context,
                              createImageProviderInstance.generatedImageURL,
                            );
                          },
                          child: Container(
                            height: MediaQueryValues.screenHeight * 0.06,
                            width: MediaQueryValues.screenWidth * 0.9,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: downloadImageProviderInstance.isDownload
                                ? Center(
                              child: AppText(
                                textData: 'Downloading...',
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                textColor: AppColors.whiteColor,
                                textAlign: TextAlign.center,
                              ),
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon
                                Container(
                                  height:
                                  MediaQueryValues.screenHeight * 0.038,
                                  width: MediaQueryValues.screenWidth * 0.06,
                                  padding: EdgeInsets.all(4),
                                  child: Image(
                                    image: AssetImage(AppAssets.downloadIcon),
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                // Space
                                SizedBox(
                                  width: MediaQueryValues.screenWidth * 0.009,
                                ),
                                // Text
                                AppText(
                                  textData: 'Download',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  textColor: AppColors.whiteColor,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Space
                    SizedBox(height: MediaQueryValues.screenHeight * 0.04),
                  ],
                );
              },
        ),
      ),
    );
  }
}
