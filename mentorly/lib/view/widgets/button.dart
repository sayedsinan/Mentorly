import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final String? image;

  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
    required this.textColor,
    required this.height,
    required this.width,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
      
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[
              Image.asset(image!, height: 24), // Optional height
              const SizedBox(height: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
