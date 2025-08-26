// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mentorly/view/ai_chat_page.dart';
import 'package:mentorly/view/home_page.dart';
import 'package:mentorly/view/leadership_page.dart';
import 'package:mentorly/view/profile_screen.dart';
import 'package:mentorly/view/quiz_page.dart';
import 'package:mentorly/view/widgets/custom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    QuizPage(),
    AiChatPage(),
    LeadershipPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
