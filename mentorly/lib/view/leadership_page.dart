import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/custom_tab_bar.dart';
import 'package:mentorly/view/widgets/leadership_app_bar.dart';

class LeadershipPage extends StatelessWidget {
  const LeadershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: LeaderboardAppBar(), body: CustomTabBar());
  }
}
