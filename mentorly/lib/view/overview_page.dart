
import 'package:flutter/material.dart';
import 'package:mentorly/utils/reponsive_card_grid.dart';

import 'package:mentorly/view/widgets/subject_focus_card.dart';
import 'package:mentorly/view/widgets/weekly_goal.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveProfileCardsGrid(),
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

