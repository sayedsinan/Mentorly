import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentorly/view/widgets/generate_button.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/task_bar.dart' show TaskCard;

class TodayPlaningContainer extends StatelessWidget {
  const TodayPlaningContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 450,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // Heading
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  'assets/target.png',
                  height: 80,
                  width: 80,
                ),
              ),
              Text(
                "Today's Learning Plan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: 105,
                decoration: BoxDecoration(
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5),
                      child: Icon(Icons.favorite_border, size: 12),
                    ),
                    Text(
                      "AI Generated",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Summary row
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                const Text("3/5 completed"),
                const SizedBox(width: 20),
                const Text("."),
                const SizedBox(width: 20),
                const Icon(FontAwesomeIcons.clock, color: Colors.grey, size: 20),
                const Text(" 85 min Total"),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Scrollable Task List
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TaskCard(
                    title: "Review Quadratic Equations",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: true,
                  ),
                  TaskCard(
                    title: "Review Trigonometry",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: false,
                  ),
                  TaskCard(
                    title: "Algebra Practice",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: false,
                  ),
                  TaskCard(
                    title: "Geometry Quiz",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: false,
                  ),
                  TaskCard(
                    title: "Statistics Overview",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: false,
                  ),
                 TaskCard(
                    title: "Statistics Overview",
                    subject: "Mathematics",
                    difficulty: "Medium",
                    time: "15 Min",
                    isCompleted: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GenerateMoreTasksButton(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
