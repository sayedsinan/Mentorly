import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/progress_bar.dart';

class WeeklyGoalWidget extends StatelessWidget {
  final String title;
  final String description;
  final int completed;
  final int total;
  final Color? progressColor;
  final Color? backgroundColor;
  final IconData? icon;

  const WeeklyGoalWidget({
    super.key,
    this.title = "Weekly Goal",
    this.description = "Quizzes completed this week",
    this.completed = 3,
    this.total = 5,
    this.progressColor = Colors.black,
    this.backgroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = total - completed;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon ?? Icons.track_changes,
                  size: 16,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ),
              Text(
                "$completed/$total",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          CustomProgressBar(progress: .6),

          const SizedBox(height: 8),

          if (remaining > 0)
            Text(
              "$remaining more to reach your goal",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            )
          else
            Text(
              "Goal completed! 🎉",
              style: TextStyle(
                fontSize: 12,
                color: Colors.green.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
