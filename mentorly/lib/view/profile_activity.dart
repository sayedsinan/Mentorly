import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/recenet_activiy_card.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class ProfileActivity extends StatelessWidget {
  const ProfileActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 450,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Recent Activity",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RecenetActiviyCard(
                    title: "Completed Calculus Quiz",
                    subtitle: "Today",
                    xpPoints: 50,
                  ),
                  RecenetActiviyCard(
                    title: "7-day streak milestone",
                    subtitle: "Yesterday",
                    xpPoints: 100,
                    icon: Icons.whatshot,
                    color: Colors.orange,
                  ),
                  RecenetActiviyCard(
                    title: "Physics practice session",
                    subtitle: "2 days ago",
                    xpPoints: 30,
                    icon: Icons.whatshot,
                    color: Colors.orange,
                  ),
                  RecenetActiviyCard(
                    title: "Algebra mastery badge",
                    subtitle: "3 days ago",
                    xpPoints: 50,
                    icon: Icons.badge,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(
              // color: Colors.amber,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month, color: purple),
                      SizedBox(width: 10),
                      Text(
                        "This Month",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("850 ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: purple)),
                SizedBox(height: 5),
                Text("XP Earned",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
