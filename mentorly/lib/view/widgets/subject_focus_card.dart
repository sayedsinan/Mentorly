import 'package:flutter/material.dart';
import 'package:mentorly/model/subject_model.dart';

class CustomSubjectsFocusCard extends StatelessWidget {
  final String strongTitle;
  final String focusTitle;
  final List<SubjectItem> strongSubjects;
  final List<SubjectItem> focusAreas;
  final Color strongAccentColor;
  final Color focusAccentColor;
  final IconData strongIcon;
  final IconData focusIcon;

  const CustomSubjectsFocusCard({
    super.key,
    this.strongTitle = "Strong Subjects",
    this.focusTitle = "Focus Areas",
    this.strongSubjects = const [
      SubjectItem("Mathematics"),
      SubjectItem("Physics"),
    ],
    this.focusAreas = const [SubjectItem("Chemistry")],
    this.strongAccentColor = Colors.green,
    this.focusAccentColor = Colors.orange,
    this.strongIcon = Icons.trending_up,
    this.focusIcon = Icons.center_focus_strong,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildCustomCard(
            title: strongTitle,
            icon: strongIcon,
            iconColor: strongAccentColor,
            subjects: strongSubjects,
            chipColor: strongAccentColor.withOpacity(0.1),
            chipTextColor: strongAccentColor,
          ),
        ),

        const SizedBox(width: 5),

        Expanded(
          child: _buildCustomCard(
            title: focusTitle,
            icon: focusIcon,
            iconColor: focusAccentColor,
            subjects: focusAreas,
            chipColor: focusAccentColor.withOpacity(0.1),
            chipTextColor: focusAccentColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<SubjectItem> subjects,
    required Color chipColor,
    required Color chipTextColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 12, color: iconColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                subjects.map((subject) {
                  return GestureDetector(
                    onTap: subject.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: chipColor,
                        borderRadius: BorderRadius.circular(20),
                        border:
                            subject.onTap != null
                                ? Border.all(color: iconColor.withOpacity(0.3))
                                : null,
                      ),
                      child: Text(
                        subject.name,
                        style: TextStyle(
                          color: chipTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
