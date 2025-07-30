import 'package:flutter/material.dart';
import 'package:imagegen/core/constants/app_assets.dart';
import 'package:imagegen/core/constants/app_colors.dart';
import 'package:imagegen/core/constants/app_routes.dart';
import 'package:imagegen/core/utils/media_query_values.dart';
import 'package:imagegen/core/reusable%20widgets/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Animation Code

  // Variables
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initializing the Animation Variables
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Starting the animation
    _controller.forward();

    // Checking that if animation ends then move to create_image_screen
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.createImage,(routes)=> false);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // App Icon
              Container(
                height: MediaQueryValues.screenHeight * 0.1,
                width: MediaQueryValues.screenWidth * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.appIcon),fit: BoxFit.contain),
                ),
              ),
              // Space
              SizedBox(height: MediaQueryValues.screenHeight * 0.01),
              // Supporting text
              AppText(
                textData: 'Turning your words\ninto stunning AI Images',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                textColor: AppColors.textColor,
                textAlign: TextAlign.center,
              ),
              // Space
              SizedBox(height: MediaQueryValues.screenHeight * 0.32),
              // Version text
              AppText(
                textData: 'Version 1.0',
                fontWeight: FontWeight.w400,
                fontSize: 18,
                textColor: AppColors.textColor.withOpacity(0.7),
                textAlign: TextAlign.center,
              ),
              // Space
              SizedBox(height: MediaQueryValues.screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
