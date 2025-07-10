import 'package:flutter/material.dart';

class PerfomanceContainer extends StatelessWidget {
  final String heading;
  final IconData icon;
  final String subHeading;

  const PerfomanceContainer({
    super.key,
    required this.heading,
    required this.icon,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = (screenWidth - 32 - 16) / 3; 

    return Container(
      width: containerWidth,
      height: 110,
   
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 8),
          Text(
            heading,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subHeading,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
