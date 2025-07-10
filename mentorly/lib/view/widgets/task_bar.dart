import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subject;
  final String difficulty;
  final String time;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.subject,
    required this.difficulty,
    required this.time,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isCompleted ? Colors.green.shade50 : Colors.white,
          border: Border.all(
            color: isCompleted ? Colors.green : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isCompleted ? title : title,
                    style: TextStyle(
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isCompleted ? Colors.grey : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildLabel(subject, Colors.grey.shade300,hasBorder: true),
                      const SizedBox(width: 6),
                      _buildLabel(
                        hasBorder: true,
                        difficulty,
                        difficulty == "Hard"
                            ? Colors.red.shade100
                            : Color(0xFFFCD1A5)
,
                        textColor: difficulty == "Hard"
                            ? Colors.red
                            : Color(0xFFFCD1A5)

                      ),
                      const SizedBox(width: 6),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildLabel(String text, Color bgColor,
    {Color? textColor, bool hasBorder = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
    
      borderRadius: BorderRadius.circular(6),
      border: hasBorder
          ? Border.all(
              color: textColor ?? Colors.black,
            )
          : null,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: textColor ?? Colors.black,
      ),
    ),
  );
}

}
