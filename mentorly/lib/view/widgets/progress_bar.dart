import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; 

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: LinearProgressIndicator(
        value: progress, 
        minHeight: 8, 
        backgroundColor: Color(0xFFF3F3F3),
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );
  }
}
