import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/input_field.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/controller/text_controller.dart';
import 'package:mentorly/controller/services/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Get.find<TextControllers>();
    final serviceController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset('assets/brain.png', fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to Mentorly",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Sign in to your learning journey",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              height: 500,
              width: 400,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InputField(
                          hintText: "Enter your Email",
                          controller: textController.emailController,
                          height: 50,
                          width: 350,
                          borderRadius: 12,
                          icon: Icons.mail_outline,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
        
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email';
                            }
        
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InputField(
                          hintText: "Enter your password",
                          controller: textController.passwordController,
                          height: 50,
                          width: 350,
                          borderRadius: 12,
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        MyButton(
                          height: 50,
                          width: 350,
                          borderRadius: 12,
                          buttonColor: blue,
                          textColor: Colors.white,
                          text: "Login",
                          style: TextStyle(),
                          onTap: () {
                            serviceController.loginUser();
                          },
                        ),
                        SizedBox(height: 20,),
        
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text("Forgot password?"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
