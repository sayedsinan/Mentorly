import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;    
  final IconData icon;
  final Color color;
  const ProfileCard({super.key,required this.title,required this.subtitle,required this.icon,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Icon(icon, size: 40, color:color),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color
            ),
          ),
          SizedBox(height: 4),
          Text(
           subtitle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
