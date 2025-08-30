import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/datas.dart';
import 'package:mentorly/controller/services/auth_controller.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/syllabus_card.dart';
import 'package:mentorly/view/strong_subject.dart';

class SyllabusScreen extends StatelessWidget {
  SyllabusScreen({super.key});

final AuthController controller = Get.find<AuthController>();
final Datas dataController = Get.find<Datas>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 16),

              const Text(
                'Academic Setup',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              const Text(
                "Let's personalize your learning experience",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Progress indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Standard',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 90),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Syllabus',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: const [
                  SizedBox(width: 5),
                  Text(
                    'Select Your Board',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Choose your curriculum board for personalized content",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // 👇 Reactive Board List
              Obx(() => Column(
                    children: dataController.boards.map((b) {
                      return BoardOptionCard(
                        title: b["title"],
                        subtitle: b["subtitle"],
                        description: b["description"],
                        isPopular: b["isPopular"],
                        isSelected:
                            controller.selectedSyllabus.value == b["title"],
                        onTap: () {
                          controller.selectSyllabus(b["title"]);
                        },
                      );
                    }).toList(),
                  )),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => Get.back(),
                      child: const Text("Back",
                          style: TextStyle(color: Colors.grey))),
                  const Text("Step 2 of 2"),
                  MyButton(
                    height: 40,
                    width: 150,
                    borderRadius: 3,
                    buttonColor: blue,
                    textColor: backgroundColor,
                    text: "Complete Setup > ",
                    style: const TextStyle(),
                    onTap: () {
                      if (controller.selectedSyllabus.value.isEmpty) {
                        Get.snackbar("Error", "Please select a board first");
                      } else {
                        // Pass selected board to next screen
                        Get.to(() => StrongSubject(),
                            arguments: controller.selectedSyllabus.value);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
