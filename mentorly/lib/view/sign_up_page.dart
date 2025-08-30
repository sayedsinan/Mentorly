import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mentorly/view/standard_screen.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/input_field.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/controller/text_controller.dart';
// import 'package:mentorly/controller/services/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Get.find<TextControllers>();
    // final serviceController = Get.find<AuthController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double inputWidth = screenWidth * 0.85;
    final double containerWidth = screenWidth * 0.9;
    final double containerHeight = screenHeight * 0.69;

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
                  "Create your account to get started",
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
                        "Create Account",
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
                                "Full Name",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InputField(
                              hintText: "Full Name",
                              controller: textController.fullName,
                              height: 50,
                              width: inputWidth,
                              borderRadius: 12,
                              icon: Icons.mail_outline,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full Name is required';
                                }

                                final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
                                if (!nameRegex.hasMatch(value)) {
                                  return 'Name can only contain letters and spaces';
                                }

                                if (value.trim().length < 2) {
                                  return 'Name must be at least 2 characters';
                                }

                                return null;
                              },
                            ),
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
                              controller: textController.signupEmail,
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
                              controller: textController.signupPasword,
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
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: MyButton(
                                height: 50,
                                width: inputWidth,
                                borderRadius: 12,
                                buttonColor: blue,
                                textColor: Colors.white,
                                text: "Create Account",
                                style: TextStyle(),
                                onTap: () =>Get.to(()=>StandardScreen())
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
                                Text("Already have an account?"),
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text("Sign in"),
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
