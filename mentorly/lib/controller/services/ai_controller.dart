import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mentorly/model/register_model.dart';
import 'package:mentorly/view/assesment_test.dart';
class AiController extends GetxController{
  var assesment= "${dotenv.env['BASE_URL']}/api/assessment";
Future<http.Response> sendPrompt(RegisterModel model) async {
    final response = await http.post(
      Uri.parse(assesment),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Successfully ai test added');
      Get.off(AssessmentTest());

      return response;
    } else {
      print('Registration failed. Response body: ${response.body}');
      print('Response code: ${response.statusCode}');
      throw Exception('Failed to register');
    }
  }
}