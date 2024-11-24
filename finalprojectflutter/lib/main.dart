import 'package:finalprojectflutter/controller/user_controller.dart';
import 'package:finalprojectflutter/pages/about_me.dart';
import 'package:finalprojectflutter/pages/contact_page.dart';
import 'package:finalprojectflutter/pages/get_started.dart';
import 'package:finalprojectflutter/pages/home_screen.dart';
import 'package:finalprojectflutter/pages/login_page.dart';
import 'package:finalprojectflutter/pages/news_page.dart';
import 'package:finalprojectflutter/pages/register_page.dart';
import 'package:finalprojectflutter/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Final Project Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/getstarted', page: () => GetStarted()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/news', page: () => NewsPage()),
        GetPage(name: '/aboutme', page: () => AboutMe()),
        GetPage(name: '/contact', page: () => ContactPage()),
      ],
    );
  }
}
