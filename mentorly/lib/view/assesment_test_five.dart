import 'package:flutter/material.dart';
import 'package:mentorly/controller/assesment_controller.dart';
import 'package:mentorly/view/result_page.dart';
import 'package:mentorly/view/widgets/answer_option.dart';
import 'package:mentorly/view/widgets/assesment_app_bar.dart';
import 'package:get/get.dart';
import 'package:mentorly/view/widgets/button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class AssessmentTestFifth extends StatelessWidget {
  const AssessmentTestFifth({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AssessmentController>();
    return Scaffold(
      appBar: const AssessmentAppBar(
        questionNumber: 5,
        totalQuestions: 5,
        progress: 1,
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
                              "Physics",
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
                      children: [
                        Text(
                          "What is the acceleration due to gravity on Earth?",
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
                                answer: "9.8 m/s²",
                                isSelected:
                                    controller.selectedAnswer.value == "9.8 m/s²",
                                onTap: () => controller.selectAnswer("9.8 m/s²"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "10 m/s²",
                                isSelected:
                                    controller.selectedAnswer.value == "10 m/s²",
                                onTap: () => controller.selectAnswer("10 m/s²"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "8.9 m/s²",
                                isSelected:
                                    controller.selectedAnswer.value == "8.9 m/s²",
                                onTap: () => controller.selectAnswer("8.9 m/s²"),
                              ),
                              SizedBox(height: 10),
                              AnswerOption(
                                answer: "11 m/s²",
                                isSelected:
                                    controller.selectedAnswer.value == "11 m/s²",
                                onTap: () => controller.selectAnswer("11 m/s²"),
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
            padding: const EdgeInsets.only(left: 15.0,right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: "Previous",
                  color: Colors.grey,
                  textColor: Colors.black,
                  height: 50,
                  width: 150,
                  fontSize:16,
                  onPressed: ()=>Get.back(),
                ),
                              MyButton(
                  text: "Finish",
                  color: purple,
                  textColor: backgroundColor,
                  height: 50,
                  width: 150,
                  fontSize:16,
                  onPressed: ()=>Get.to(const ResultPage(),transition: Transition.rightToLeft )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
