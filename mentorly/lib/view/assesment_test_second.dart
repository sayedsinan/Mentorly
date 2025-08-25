import 'package:flutter/material.dart';
import 'package:mentorly/controller/assesment_controller.dart';
import 'package:mentorly/view/assesment_test_fourth.dart';

import 'package:mentorly/view/widgets/answer_option.dart';
import 'package:mentorly/view/widgets/assesment_app_bar.dart';
import 'package:get/get.dart';
import 'package:mentorly/view/widgets/button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class AssessmentTestThird extends StatelessWidget {
  const AssessmentTestThird({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AssessmentController>();
    return Scaffold(
      appBar: const AssessmentAppBar(
        questionNumber: 3,
        totalQuestions: 5,
        progress: 0.6,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Container(
              height: 450,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(144, 138, 92, 246),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "Mathematics",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(130, 177, 89, 52),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "Medium",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is the derivative of x³?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(
                          () => Column(
                            children: [
                              AnswerOption(
                                answer: "3x²",
                                isSelected:
                                    controller.selectedAnswer.value == "3x²",
                                onTap: () => controller.selectAnswer("3x²"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "x²",
                                isSelected:
                                    controller.selectedAnswer.value == "x²",
                                onTap: () => controller.selectAnswer("x²"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "3x",
                                isSelected:
                                    controller.selectedAnswer.value == "3x",
                                onTap: () => controller.selectAnswer("Wa3xtt"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "x³",
                                isSelected:
                                    controller.selectedAnswer.value == "x³",
                                onTap: () => controller.selectAnswer("x³"),
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
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: "Previous",
                  color: Colors.grey,
                  textColor: Colors.black,
                  height: 50,
                  width: 150,
                  fontSize: 16,
                  onPressed: () => Get.back(),
                ),
                MyButton(
                  text: "Next",
                  color: purple,
                  textColor: backgroundColor,
                  height: 50,
                  width: 150,
                  fontSize: 16,
                  onPressed:
                      () => Get.to(
                        const AssessmentTestFourth(),
                        transition: Transition.rightToLeft,
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
