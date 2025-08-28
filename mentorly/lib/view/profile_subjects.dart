import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/subject_card.dart';

class ProfileSubjects extends StatelessWidget {
  const ProfileSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SubjectCard(
            subjectName: "Mathematics",
            proficiencyLevel: "Advanced",
            progress: .7,
            completionStatus: "75",
          ),
          SizedBox(height: 20),
          SubjectCard(
            subjectName: "Physics",
            proficiencyLevel: "Intermediate",
            progress: .5,
            completionStatus: "50",
          ),
          SizedBox(height: 20),
          SubjectCard(
            subjectName: "Chemistry",
            proficiencyLevel: "Advanced",
            progress: .2,
            completionStatus: "40",
          ),
          SizedBox(height: 20),
          DottedBorder(
            dashPattern: const [6, 6],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: Colors.grey,
            strokeWidth: 2,
            child: SizedBox(
              width: 400,

              child: Column(
                children: [
                  Image.asset(
                    'assets/brain.png',
                    color: Colors.grey,
                    height: 70,
                    width: 70,
                  ),
                  Text(
                    "Add a new subject to track your progres",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Add Subject",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
