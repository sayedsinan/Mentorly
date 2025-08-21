import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/button.dart';
import 'package:mentorly/view/widgets/home_app_bar.dart';
import 'package:mentorly/view/widgets/motivation_box.dart';
import 'package:mentorly/view/widgets/perfomance_container.dart';
import 'package:mentorly/view/widgets/progress_card.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/today_planing_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey),
              const MotivationBox(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    PerfomanceContainer(
                      heading: "45m",
                      icon: Icons.timelapse,
                      subHeading: "Study Time",
                    ),
                    PerfomanceContainer(
                      heading: "45m",
                      icon: Icons.timelapse,
                      subHeading: "Study Time",
                    ),
                    PerfomanceContainer(
                      heading: "45m",
                      icon: Icons.timelapse,
                      subHeading: "Study Time",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TodayPlaningContainer(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/target.png', height: 60, width: 60),
                  Text(
                    "Your Progress",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ProgressCard(
                title: "Mathematics",
                progress: "75%",
                strongAreas: ["Algebra", "Geomatry", "Calculas"],
                needsImprovement: ["Trigonometry"],
                onTap: () {},
                buttonText: "Practice Mathematics",
              ),
              const SizedBox(height: 20),
              ProgressCard(
                title: "Physics",
                progress: "75%",
                strongAreas: ["Mechanics", "Thermodynamics"],
                needsImprovement: ["Optics", "Waves"],
                onTap: () {},
                buttonText: "Practice Physics",
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  MyButton(
                    text: "Take a Quiz",
                    color: blue,
                    textColor: Colors.white,
                    height: 80,
                    width: 200,
                    image: 'assets/book.png',
                    onPressed: () {},
                  ),
                  SizedBox(width: 15),
                  MyButton(
                    text: "Ask AI",
                    color: backgroundColor,
                    textColor: Colors.black,
                    height: 80,
                    width: 200,
                    image: 'assets/book.png',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
