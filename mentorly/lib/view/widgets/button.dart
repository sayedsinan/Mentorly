import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final String? image;
  final double? fontSize;

  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
    required this.textColor,
    required this.height,
    required this.width,
    this.image,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null) ...[
          Image.asset(
            image!,
            height: 50,
          ),
          const SizedBox(height: 8),
        ],
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
