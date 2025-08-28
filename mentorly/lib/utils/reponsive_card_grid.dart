import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/profile_card.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
class ResponsiveProfileCardsGrid extends StatelessWidget {
  const ResponsiveProfileCardsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileData = [
      {
        'title': '7',
        'subtitle': 'Daily Streak',
        'icon': Icons.whatshot,
        'color': Colors.red,
      },
      {
        'title': '45 h',
        'subtitle': 'Study Time',
        'icon': Icons.timer,
        'color': blue,
      },
      {
        'title': '45',
        'subtitle': 'Quizes',
        'icon': Icons.book,
        'color': green,
      },
      {
        'title': '87',
        'subtitle': 'Avg Score',
        'icon': Icons.auto_graph_outlined,
        'color': purple,
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        
        // Determine number of columns based on screen width
        int crossAxisCount;
        double aspectRatio;
        
        if (screenWidth < 400) {
          // Very small screens: 2 columns
          crossAxisCount = 2;
          aspectRatio = 1.3;
        } else if (screenWidth < 600) {
          // Small screens: 2 columns with better spacing
          crossAxisCount = 2;
          aspectRatio = 1.4;
        } else if (screenWidth < 900) {
          // Medium screens: 4 columns in single row
          crossAxisCount = 4;
          aspectRatio = 1.2;
        } else {
          // Large screens: 4 columns with more space
          crossAxisCount = 4;
          aspectRatio = 1.3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: profileData.length,
          itemBuilder: (context, index) {
            final data = profileData[index];
            return ProfileCard(
              title: data['title'],
              subtitle: data['subtitle'],
              icon: data['icon'],
              color: data['color'],
            );
          },
        );
      },
    );
  }
}