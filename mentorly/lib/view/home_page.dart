import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentorly/view/widgets/motivation_box.dart';
import 'package:mentorly/view/widgets/perfomance_container.dart';
import 'package:mentorly/view/widgets/progress_bar.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFE9D8FD),
                    backgroundImage: AssetImage('assets/brain.png'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Good morning, Alex!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: const [
                            Icon(
                              Icons.star_border,
                              color: Colors.orange,
                              size: 16,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "Level 12",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(" · "),
                            Text(
                              "2450 XP",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_outlined),
                      SizedBox(width: 10),
                      Icon(Icons.settings),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEDD5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          FontAwesomeIcons.fire,
                          color: Colors.red,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '7 day streak',
                          style: TextStyle(
                            color: Color(0xFFA24D46),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Daily Goal',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '3/5',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const CustomProgressBar(progress: 0.6),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey),
              MotivationBox(),
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
              SizedBox(height: 20),
              Container(
                height: 600,
                width: 450,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
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
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBEAFE),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 5.0,
                                  right: 5,
                                ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(children: [Text("3/5 completed"),Text(".")]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
