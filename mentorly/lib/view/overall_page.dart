import 'package:flutter/material.dart';
import 'package:mentorly/model/leadership_model.dart';
import 'package:mentorly/view/widgets/leader_ship_card.dart';

class OverallPage extends StatelessWidget {
  const OverallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(5, (index) {
          return LeaderShipCard(
            user: LeaderShipUser(
              userName: "John Doe",
              level: 12,
              xpPoints: 2300,
              avatarUrl: "https://example.com/avatar.jpg",
            ),
          );
        }),
      ),
    );
  }
}
