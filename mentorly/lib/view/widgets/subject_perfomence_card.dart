import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/style/colors.dart';

class SubjectPerfomenceCard extends StatelessWidget {
  final String subject;
  final int correctAnswers;
  final int totalQuestions;
  final double percentage;
  const SubjectPerfomenceCard({
    super.key,
    required this.subject,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                subject,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "$correctAnswers/$totalQuestions Correct",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),

          const Spacer(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(percentage ).toStringAsFixed(0)}%",
                style: TextStyle(
                  fontSize: 16,
                  color: purple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: 50,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text(
                    "Focus",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
