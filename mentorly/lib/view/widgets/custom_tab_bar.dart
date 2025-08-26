import 'package:flutter/material.dart';
import 'package:mentorly/view/awards_page.dart';
import 'package:mentorly/view/overall_page.dart';
import 'package:mentorly/view/weekly_page.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  final List<String> tabs = ['Overall', 'Weekly', 'Awards'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children:
                tabs.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tab = entry.value;
                  bool isSelected = selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow:
                              isSelected
                                  ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                  : null,
                        ),
                        child: Center(
                          child: Text(
                            tab,
                            style: TextStyle(
                              color:
                                  isSelected ? Colors.black : Colors.grey[600],
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: _getTabContent(selectedIndex),
          ),
        ),
      ],
    );
  }

  Widget _getTabContent(int index) {
    switch (index) {
      case 0:
        return const OverallPage();
      case 1:
        return const WeeklyPage();
      case 2:
        return const AwardsPage();
      default:
        return const Center(
          child: Text("Something Went Wrong", style: TextStyle(fontSize: 18)),
        );
    }
  }
}
