import 'package:flutter/material.dart';

class AssessmentCard extends StatelessWidget {
  final String number;
  final String label;
  final double width;
  final double height;
  final bool isTablet;
  final bool isSmallScreen;
  final Color lightPurple;
  final Color purple;

  const AssessmentCard({
    Key? key,
    required this.number,
    required this.label,
    required this.width,
    required this.height,
    required this.isTablet,
    required this.isSmallScreen,
    this.lightPurple = const Color(0xFFFAF5FF), // default #faf5ff
    this.purple = const Color(0xFF7E22CE),     // default #7e22ce
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(isTablet ? 12 : 10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: isTablet
                  ? 32
                  : isSmallScreen
                      ? 20
                      : 24,
              fontWeight: FontWeight.bold,
              color: purple,
            ),
          ),
          SizedBox(height: isTablet ? 8 : 4),
          Text(
            label,
            style: TextStyle(
              fontSize: isTablet
                  ? 18
                  : isSmallScreen
                      ? 14
                      : 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
