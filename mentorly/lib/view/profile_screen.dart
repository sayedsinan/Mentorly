import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/profile_app_bar.dart';
import 'package:mentorly/view/widgets/profile_tab_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: ProfileAppBar(),
            ),
          ];
        },
        body: const ProfileTabBar(),
      ),
    );
  }
}
