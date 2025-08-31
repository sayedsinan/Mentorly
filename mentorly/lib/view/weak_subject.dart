import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/datas.dart';
import 'package:mentorly/controller/services/auth_controller.dart';
import 'package:mentorly/controller/text_controller.dart';
import 'package:mentorly/model/register_model.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/weak_subject_card.dart';

class WeakSubject extends StatelessWidget {
  const WeakSubject({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final Datas dataController = Get.find<Datas>();
    final TextControllers textControllers = Get.find<TextControllers>();
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
                  color: green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 16),

              const Text(
                'Subject Assessment',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              const Text(
                "Which subjects need more attention? ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 170,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 170,
                    decoration: BoxDecoration(
                      color: green,
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
                      'Strong Subjects',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 90),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Weak Subjects',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(width: 30),
                  Text(
                    'Subjects Needing Improvement',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const SizedBox(width: 30),
              const Text(
                "Select subjects you'd like to focus on improving (choose at least 1)",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Column(
                  children:
                      dataController.subjects.map((subjectData) {
                        final subject = subjectData['subject'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: WeakSubjectCard(
                            subject: subject,
                            topics: subjectData['topics'],
                            icon: subjectData['icon'],
                            isSelected: controller.weakSubjects.contains(
                              subject,
                            ),
                            onTap: () {
                              controller.selectWeakSubject(subject);
                            },
                          ),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyButton(
                    height: 40,
                    width: 150,
                    borderRadius: 3,
                    buttonColor: blue,
                    textColor: backgroundColor,
                    text: "Continue to test ",
                    style: const TextStyle(),
                    onTap: () {
                      if (controller.weakSubjects.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please select at least 1 subject",
                        );
                      } else {
                        controller.registerPost(
                          RegisterModel(
                            email: textControllers.signupEmail.text,
                            password: textControllers.signupPasword.text,
                            fullName: textControllers.fullName.text,
                            medium: controller.selectedGrade.value,
                            board: controller.selectedSyllabus.value,
                            strongSubjects: controller.strongSubjects,
                            weakSubjects: controller.weakSubjects,
                          ),
                        );
                        print("heloooooo");
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
