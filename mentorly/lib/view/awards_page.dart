import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/achievment_card.dart';


class AwardsPage extends StatelessWidget {
  const AwardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(5, (index) {
          return AchievementCard(
           description: "Complete 50 quizzes",
           icon: Icons.star,
           isEarned:true ,
           title: "Quiz Master",
          );
        }),
      ),
    );
  }
}
