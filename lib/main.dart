import 'package:check_list/db/db_helper.dart';
import 'package:check_list/services/Theme_service.dart';
import 'package:check_list/ui/home_page.dart';
import 'package:check_list/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/loading-circles.json'),
      nextScreen:  MyHomePage(),
      backgroundColor: Colors.white,
      splashIconSize: 250,
    //  splashTransition: SplashTransition.slideTransition
     // pageTransitionType: PageTransitionType.topToBottom,
      duration: 2000,
     // animationDuration: Duration(seconds: 1),
    );
  }
}
