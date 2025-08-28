import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mentorly/view/sign_up_page.dart';
import 'package:mentorly/view/widgets/main_screen.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/input_field.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/controller/text_controller.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Get.find<TextControllers>();
  

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double inputWidth = screenWidth * 0.85;
    final double containerWidth = screenWidth * 0.9;
    final double containerHeight = screenHeight * 0.65;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Container(
                    height: screenHeight * 0.1,
                    width: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset('assets/brain.png', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Welcome to Mentorly",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Sign in to your learning journey",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
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
                  height: containerHeight,
                  width: containerWidth,
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InputField(
                              hintText: "Enter your Email",
                              controller: textController.emailController,
                              height: 50,
                              width: inputWidth,
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
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InputField(
                              hintText: "Enter your password",
                              controller: textController.passwordController,
                              height: 50,
                              width: inputWidth,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: MyButton(
                                height: 50,
                                width: inputWidth,
                                borderRadius: 12,
                                buttonColor: blue,
                                textColor: Colors.white,
                                text: "Login",
                                style: TextStyle(),
                                onTap: () {
                               
                                  Get.to(MainScreen());
                                },
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("Forgot password?"),
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have ann account?"),
                                TextButton(
                                  onPressed: ()=>Get.to(()=>SignUpPage()),
                                  child: Text("Sign Up"),
                                ),
                              ],
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
        ),
      ),
    );
  }
}
