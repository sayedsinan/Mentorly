import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/quick_question.dart';
import 'package:mentorly/controller/chat_controller.dart';
class QuickQuestionsSection extends StatelessWidget {
  final ChatController controller;

  const QuickQuestionsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final questions = [
      {'text': 'Explain quadratic equations', 'icon': Icons.calculate_outlined, 'tag': 'Math'},
      {'text': 'Help with Physics', 'icon': Icons.thunderstorm, 'tag': 'Physics'},
      {'text': 'How does AI work?', 'icon': Icons.psychology, 'tag': 'AI'},
      {'text': 'Explain Newton\'s laws', 'icon': Icons.science, 'tag': 'Science'},
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Quick Questions", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: QuickQuestion(
                  text: questions[0]['text'] as String,
                  icon: questions[0]['icon'] as IconData,
                  onTap: () => controller.sendQuickQuestion(
                    questions[0]['text'] as String,
                    questions[0]['tag'] as String,
                  ),
                ),
              ),
              Expanded(
                child: QuickQuestion(
                  text: questions[1]['text'] as String,
                  icon: questions[1]['icon'] as IconData,
                  onTap: () => controller.sendQuickQuestion(
                    questions[1]['text'] as String,
                    questions[1]['tag'] as String,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: QuickQuestion(
                  text: questions[2]['text'] as String,
                  icon: questions[2]['icon'] as IconData,
                  onTap: () => controller.sendQuickQuestion(
                    questions[2]['text'] as String,
                    questions[2]['tag'] as String,
                  ),
                ),
              ),
              Expanded(
                child: QuickQuestion(
                  text: questions[3]['text'] as String,
                  icon: questions[3]['icon'] as IconData,
                  onTap: () => controller.sendQuickQuestion(
                    questions[3]['text'] as String,
                    questions[3]['tag'] as String,
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
