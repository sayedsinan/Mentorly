import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentorly/controller/text_controller.dart';

import 'package:mentorly/model/login.dart';
import 'package:mentorly/model/register_model.dart';

const String base = 'http://10.0.2.2:3000';

const loginApi = "$base/api/user";
const register = "$base/api/user/register";

class AuthController extends GetxController {
  final controller = Get.find<TextControllers>();
  var selectedGrade = "".obs;
  var selectedSyllabus = "".obs;
  var strongSubjects = <String>[].obs;
  var weakSubjects = <String>[].obs;

  void selectStrongSubject(String subject) {
    if (strongSubjects.contains(subject)) {
      strongSubjects.remove(subject);
    } else {
      strongSubjects.add(subject);
    }
    print(strongSubjects);
  }

  void selectWeakSubject(String subject) {
    if (weakSubjects.contains(subject)) {
      weakSubjects.remove(subject);
    } else {
      weakSubjects.add(subject);
    }
    print(weakSubjects);
  }

  void selectSyllabus(String syllabus) {
    selectedSyllabus.value = syllabus;
    print(selectedSyllabus.value);
  }

  void selectGrade(String grade) {
    selectedGrade.value = grade;
    print(selectedGrade.value);
  }

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
  Future<http.Response> registerPost(RegisterModel model) async {
    final response = await http.post(
      Uri.parse(register ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Successfully registered');

      return response;
    } else {
      print('Registration failed. Response body: ${response.body}');
      print('Response code: ${response.statusCode}');
      throw Exception('Failed to register');
    }
  }
}
