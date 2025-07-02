import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mentorly/controller/text_controller.dart';
import 'package:mentorly/view/widgets/input_field.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = Get.find<TextControllers>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                
                SizedBox(height: 50,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text("Sign In",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      InputField(
                        hintText: "Enter your Email",
                        controller: textController.emailController,
                        height: 50,
                        width: 350,
                        borderRadius: 12,
                        icon: Icons.mail_outline,
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),
                      InputField(
                        hintText: "Enter your password",
                        controller: textController.passwordController,
                        height: 50,
                        width: 350,
                        borderRadius: 12,
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text("Forgot password?"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
