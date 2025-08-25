import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback? onTap;

  const AnswerOption({
    super.key,
    required this.answer,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFFF3E8FF) // Light purple background when selected
              : Colors.white,
          border: Border.all(
            color: isSelected 
                ? const Color(0xFF8B5CF6) // Purple border when selected
                : const Color(0xFFE5E7EB), // Gray border when not selected
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected 
                    ? const Color(0xFF8B5CF6) // Purple when selected
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected 
                      ? const Color(0xFF8B5CF6)
                      : const Color(0xFFD1D5DB), // Light gray when not selected
                  width: 2,
                ),
              ),
              child: isSelected 
                  ? const Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              answer,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected 
                    ? const Color(0xFF8B5CF6) // Purple text when selected
                    : const Color(0xFF374151), // Dark gray when not selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}

