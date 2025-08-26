import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isEarned;

  const AchievementCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.isEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isEarned ? const Color(0xFFFFF8E1) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEarned ? const Color(0xFFFFD54F) : Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: isEarned ? [
          BoxShadow(
            color: const Color(0xFFFFD54F).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ] : [],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isEarned ? const Color(0xFFFFF176) : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isEarned ? const Color(0xFFE65100) : Colors.grey.shade400,
              size: 24,
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Achievement Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isEarned ? Colors.black87 : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: isEarned ? Colors.grey.shade600 : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          
          // Status Badge
          if (isEarned)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8F00),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Earned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          else
            Icon(
              Icons.star_outline,
              color: Colors.grey.shade300,
              size: 24,
            ),
        ],
      ),
    );
  }
}