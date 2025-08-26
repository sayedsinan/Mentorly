import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/controller/chat_controller.dart';
import 'package:mentorly/model/message.dart';
class MessageBubble extends StatelessWidget {
  final Message message;
  final ChatController controller;

  const MessageBubble({super.key, required this.message, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(color: Color(0xFF4CAF50), shape: BoxShape.circle),
              child: const Icon(Icons.smart_toy, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isUser ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.tag != null) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                          child: Text(message.tag!, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        message.text,
                        style: TextStyle(color: message.isUser ? Colors.white : Colors.black87, fontSize: 14, height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(controller.formatTime(message.timestamp), style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              ],
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 8),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              child: const Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ],
      ),
    );
  }
}
