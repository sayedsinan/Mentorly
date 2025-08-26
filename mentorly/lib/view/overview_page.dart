// weekly_goal_widget.dart


// Updated OverviewPage with the weekly goal widget
import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/profile_card.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/subject_focus_card.dart';
import 'package:mentorly/view/widgets/weekly_goal.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileCard(
                title: "7",
                subtitle: "Daily Streak",
                icon: Icons.whatshot,
                color: Colors.red,
              ),
              ProfileCard(
                title: "45 h",
                subtitle: "Study Time",
                icon: Icons.timer,
                color: blue,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileCard(
                title: "45",
                subtitle: "Quizes",
                icon: Icons.book,
                color: green,
              ),
              ProfileCard(
                title: "87",
                subtitle: "Avg Score",
                icon: Icons.auto_graph_outlined,
                color: purple,
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          WeeklyGoalWidget(
            title: "Weekly Goal",
            description: "Quizzes completed this week",
            completed: 3,
            total: 5,
            progressColor: Colors.black,
            icon: Icons.track_changes,
          ),
          
          const SizedBox(height: 20),
       CustomSubjectsFocusCard()
        ],
      ),
    );
  }
}

