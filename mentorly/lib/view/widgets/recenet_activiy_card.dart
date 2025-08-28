import 'package:flutter/material.dart';

class RecenetActiviyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int xpPoints;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? xpColor;
  final VoidCallback? onTap;
  final Color? color;

  const RecenetActiviyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.xpPoints,
    this.icon = Icons.menu_book_outlined,
    this.backgroundColor,
    this.textColor,
    this.xpColor = Colors.purple,
    this.onTap,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!, width: 1),
          ),
          child: Row(
            children: [
              Icon(icon, size: 24, color: color ?? Colors.blue[600]),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // XP Points
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+${xpPoints}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: xpColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'XP',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
