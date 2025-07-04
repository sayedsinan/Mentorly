import 'package:flutter/material.dart';
import 'package:mentorly/controller/services/auth_controller.dart';
import 'package:mentorly/controller/text_controller.dart';
import 'package:mentorly/view/home_page.dart';
import 'package:mentorly/view/login.dart';
import 'package:mentorly/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  Get.put(TextControllers());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mentorly',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
