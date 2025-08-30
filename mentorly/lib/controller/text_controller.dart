import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TextControllers extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signupPasword = TextEditingController();
  final nameController = TextEditingController();
final signupEmail= TextEditingController();
      final fullName = TextEditingController();



  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}