import 'package:flutter/material.dart';
import 'package:mentorly/view/widgets/progress_bar.dart';
class SubjectCard extends StatelessWidget {
  final String subjectName;
  final String proficiencyLevel;
  final double progress; 
  final String completionStatus;
  const SubjectCard({super.key, required this.subjectName, required this.proficiencyLevel, required this.progress, required this.completionStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
        
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
           
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    subjectName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$completionStatus%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Text(
                      proficiencyLevel,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    "Complete",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 15),
        
           
              const CustomProgressBar(progress: 0.5),
            ],
          ),
        );
  }
}