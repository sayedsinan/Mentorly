import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/view/widgets/my_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/syllabus_card.dart';
import 'package:mentorly/view/strong_subject.dart'; 

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

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
                    'Select Your Standard',
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

              BoardOptionCard(
                title: "CBSE",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: true,
              ),
              BoardOptionCard(
                title: "ICSE",
                subtitle: "Indian Certificate of Secondary Education",
                description:
                    "English-medium education with comprehensive curriculum",
                isSelected: true,
                onTap: () {},
                isPopular: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("State Boards")],
              ),
              BoardOptionCard(
                title: "Kerala State Board",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: false,
              ),
              BoardOptionCard(
                title: "Tamil Nadu Board",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: false,
              ),
              BoardOptionCard(
                title: "Maharashtra Board",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: false,
              ),
              BoardOptionCard(
                title: "Karnataka Board",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: false,
              ),
              BoardOptionCard(
                title: "Andra pradesh Board",
                subtitle: "Central Board of Secondary Education",
                description: "National curriculum followed across India",
                isSelected: false,
                onTap: () {},
                isPopular: false,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.space,
                children: [
                  TextButton(onPressed: ()=>Get.back(), child: Text("Back",style: TextStyle(color: Colors.grey),)),
                  Text("Step 2 of 2"),
                  MyButton(
                    height: 40,
                    width: 150,
                    borderRadius: 3,
                    buttonColor: blue,
                    textColor: backgroundColor,
                    text: "Complete Setup > ",
                    style: TextStyle(),
                    onTap: () => Get.to(() => StrongSubject()),
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
