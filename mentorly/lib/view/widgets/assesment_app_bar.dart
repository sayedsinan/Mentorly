import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/assesment_controller.dart';
import 'package:mentorly/view/widgets/style/colors.dart';


class AssessmentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int questionNumber;
  final int totalQuestions;
  final double progress;

  const AssessmentAppBar({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final AssessmentController controller = Get.find<AssessmentController>();

    return AppBar(
      toolbarHeight: 130,
      automaticallyImplyLeading: false,
      backgroundColor: purple,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Assessment Test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(() => Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.white, size: 20),
                          const SizedBox(width: 6),
                          Text(
                            controller.formattedTime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question $questionNumber of $totalQuestions',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}% Complete',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
