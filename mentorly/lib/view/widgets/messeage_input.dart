import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/chat_controller.dart';
class MessageInput extends StatelessWidget {
  final ChatController controller;

  const MessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: "Type your message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onSubmitted: (text) => controller.sendMessage(text),
            ),
          ),
          const SizedBox(width: 8),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: controller.isSending.value ? Colors.grey : Colors.blue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: controller.isSending.value
                    ? null
                    : () => controller.sendMessage(controller.messageController.text),
                icon: Icon(
                  controller.isSending.value ? Icons.hourglass_empty : Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
