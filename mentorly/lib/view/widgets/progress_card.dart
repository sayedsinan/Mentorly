import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/progress_bar.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String progress;
  final List<String> strongAreas;
  final List<String> needsImprovement;
  final VoidCallback onTap;
  final String buttonText;

  const ProgressCard({
    super.key,
    required this.title,
    required this.progress,
    required this.strongAreas,
    required this.needsImprovement,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                progress,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Progress Bar
          CustomProgressBar(
            progress: double.tryParse(progress.replaceAll('%', ''))! / 100,
          ),
          const SizedBox(height: 16),

          // Strong Areas Section
          const Text(
            'Strong Areas',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children:
                strongAreas.map((area) => _ChipLabel(label: area)).toList(),
          ),
          const SizedBox(height: 16),

          // Needs Improvement Section
          if (needsImprovement.isNotEmpty) ...[
            Row(
              children: const [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 18,
                  color: Colors.orange,
                ),
                SizedBox(width: 6),
                Text(
                  'Needs Improvement',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children:
                  needsImprovement
                      .map((area) => _ChipLabel(label: area, isError: true))
                      .toList(),
            ),
            const SizedBox(height: 16),
          ],

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF1877F2)),
              ),
              child:  Text(
                buttonText,
                style: TextStyle(color: Color(0xFF1877F2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipLabel extends StatelessWidget {
  final String label;
  final bool isError;

  const _ChipLabel({required this.label, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: isError ? Colors.transparent : const Color(0xFFF0F4FF),
        border: isError ? Border.all(color: Colors.orange) : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isError ? Colors.orange : const Color(0xFF3366FF),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
