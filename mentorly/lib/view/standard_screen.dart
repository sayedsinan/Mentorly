import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/view/syllabus_screen.dart';
import 'package:mentorly/view/widgets/class_card.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class StandardScreen extends StatelessWidget {
  const StandardScreen({super.key});

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
                      color: Colors.grey[300],
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
              // Select Your Standard
              Row(
                children: const [
                  SizedBox(width: 30),
                  Text(
                    'Select Your Standard',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Choose the class you're currently studying in",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ClassCard(title: 'Class 6', subtitle: 'Grade 6'),
                  ClassCard(title: 'Class 7', subtitle: 'Grade 7'),
                  ClassCard(title: 'Class 8', subtitle: 'Grade 8'),
                  ClassCard(title: 'Class 9', subtitle: 'Grade 9'),
                  ClassCard(title: 'Class 9', subtitle: 'Grade 10'),
                  ClassCard(title: 'Class 9', subtitle: 'Grade 11'),
                  ClassCard(title: 'Class 9', subtitle: 'Grade 12'),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyButton(
                    height: 40,
                    width: 100,
                    borderRadius: 3,
                    buttonColor: blue,
                    textColor: backgroundColor,
                    text: "Next > ",
                    style: TextStyle(),
                    onTap: () => Get.to(() => SyllabusScreen()),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
