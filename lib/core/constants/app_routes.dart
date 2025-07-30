import 'package:flutter/material.dart';
import 'package:imagegen/features/result/presentation/screen/result_screen.dart';
import 'package:imagegen/features/splash/presentation/splash_screen.dart';
import 'package:imagegen/features/create%20image/presentation/create_image_screen.dart';


class AppRoutes {
  static const String splash = '/splash';
  static const String createImage = '/createImage';
  static const String result = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case createImage:
        return MaterialPageRoute(builder: (_) => CreateImageScreen());
      case result:
        return MaterialPageRoute(builder: (_) => ResultScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
    }
  }
}
