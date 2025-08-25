import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mentorly/view/home_page.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/question_review_card.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/subject_perfomence_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), 
      body: SafeArea(
        child: Center(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Assessment Completed!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Here's your performance summary",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "40%",
                    style: TextStyle(
                      fontSize: 40,
                      color: purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Overall Score: 2/5",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 30),

                  // Subject Performance
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Subject Performance",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  const SubjectPerfomenceCard(
                    subject: "Mathematics",
                    correctAnswers: 1,
                    totalQuestions: 2,
                    percentage: 50,
                  ),
                  const SizedBox(height: 10),
                  const SubjectPerfomenceCard(
                    subject: "Physics",
                    correctAnswers: 1,
                    totalQuestions: 2,
                    percentage: 50,
                  ),
                  const SizedBox(height: 10),
                  const SubjectPerfomenceCard(
                    subject: "Chemistry",
                    correctAnswers: 0,
                    totalQuestions: 2,
                    percentage: 0,
                  ),

                  const SizedBox(height: 30),

                  // Question Review Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Question Review",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  QuestionReviewCard(
                    icon: Icons.close,
                    iconColor: Colors.red,
                    question: "Question 1",
                    status: "Mathematics • Easy",
                  ),
                  const SizedBox(height: 10),
                  QuestionReviewCard(
                    icon: Icons.check,
                    iconColor: Colors.green,
                    question: "Question 2",
                    status: "Mathematics • Easy",
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    height: 50,
                    width: 300,
                    borderRadius: 12,
                    buttonColor: purple,
                    textColor: Colors.white,
                    text: "Continue to Dashboard",
                    style: TextStyle(),
                    onTap: () {
                      Get.to(
                        const HomePage(),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
