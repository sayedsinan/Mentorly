import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/leadership_weekly.dart';

class WeeklyPage extends StatelessWidget {
  const WeeklyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(5, (index) {
          return LeaderboardCardWeekly(
            rank: 1,
            name: "sinan",
            accuracy: "99",
            points: 200,
            timeFrame: "This week",
          );
        }),
      ),
    );
  }
}
