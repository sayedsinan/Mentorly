import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentorly/controller/text_controller.dart';

import 'package:mentorly/model/login.dart';

const String base = 'http://localhost:3000';

const loginApi = "$base/api/user";

class AuthController extends GetxController {
  final controller = Get.find<TextControllers>();
  Future<http.Response> loginPost(Login login) async {
    final response = await http.post(
      Uri.parse(loginApi),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(login.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Successfully logged in');

      return response;
    } else {
      print('Login failed. Response body: ${response.body}');
      print('Response code: ${response.statusCode}');
      throw Exception('Failed to login');
    }
  }

  Future<void> loginUser() async {
    Login userLogin = Login(
      email: controller.emailController.text,
      password: controller.passwordController.text,
    );

    try {
      final response = await loginPost(userLogin);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success");
        Get.toNamed('/home');
        final responseBody = jsonDecode(response.body);
        print(responseBody);
      } else {
        print("Else block");
      }
    } catch (e) {
      print(e);
    }
  }
}
