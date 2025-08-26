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
      body: Obx(
        () => SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              QuickQuestionsSection(controller: controller),
              const SizedBox(height: 12),
              ...controller.messages.map(
                (message) => MessageBubble(
                  message: message,
                  controller: controller,
                ),
              ),
              if (controller.isTyping.value) const TypingIndicator(),

              const SizedBox(height: 16),

              MessageInput(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
