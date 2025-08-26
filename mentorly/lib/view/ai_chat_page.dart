import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/chat_controller.dart';
import 'package:mentorly/view/widgets/chat_app_bar.dart';
import 'package:mentorly/view/widgets/messeage_bubble.dart';
import 'package:mentorly/view/widgets/messeage_input.dart';
import 'package:mentorly/view/widgets/quick_question_section.dart';

import 'package:mentorly/view/widgets/typing_indicator.dart';

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find<ChatController>();

    return Scaffold(
      appBar: const AILearningAppBar(),
      body: Column(
        children: [
          QuickQuestionsSection(controller: controller),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        controller: controller.scrollController,
                        padding: const EdgeInsets.all(16.0),
                        itemCount:
                            controller.messages.length +
                            (controller.isTyping.value ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == controller.messages.length &&
                              controller.isTyping.value) {
                            return const TypingIndicator();
                          }
                          final message = controller.messages[index];
                          return MessageBubble(
                            message: message,
                            controller: controller,
                          );
                        },
                      ),
                    ),
                  ),

                  MessageInput(controller: controller),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
