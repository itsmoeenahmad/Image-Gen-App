import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imagegen/core/constants/app_routes.dart';
import 'package:imagegen/core/utils/media_query_values.dart';
import 'package:imagegen/features/splash/presentation/splash_screen.dart';
import 'package:imagegen/features/result/domain/provider/download_image_provider.dart';
import 'package:imagegen/features/create%20image/domain/provider/create_image_provider.dart';

void main() async{
  // Loading OPENAI_API_KEY from .env file
  await dotenv.load(fileName: ".env");
  // Setting the OPENAI_API_KEY
  OpenAI.apiKey = dotenv.env['OPENAI_API_KEY']!;
  // Running app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Setting the MediaQuery values at start
    MediaQueryValues.initialize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CreateImageProvider()),
        ChangeNotifierProvider(create: (context)=> DownloadImageProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Gen',
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
        home: SplashScreen(),
      ),
    );
  }
}
