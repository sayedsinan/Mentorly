import 'package:flutter/material.dart ';
import 'package:get/get.dart';
import 'package:mentorly/model/message.dart';
class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  
  final RxList<Message> messages = <Message>[
    Message(
      text: "Hi Alex! I'm your AI learning assistant. I can help you with any doubts, explain concepts, or provide study guidance. What would you like to learn about today?",
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    Message(
      text: "Explain quadratic equations",
      isUser: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 18)),
      tag: "Math",
    ),
    Message(
      text: "Great question! Let me break this down for you step by step...",
      isUser: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 18)),
    ),
  ].obs;

  final RxBool isTyping = false.obs;
  final RxBool isSending = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Auto-scroll when new messages are added
    ever(messages, (_) => scrollToBottom());
  }

  void sendMessage(String text, {String? tag}) {
    if (text.trim().isEmpty || isSending.value) return;

    isSending.value = true;

    // Add user message
    messages.add(Message(
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
      tag: tag,
    ));

    messageController.clear();
    
    // Show typing indicator
    isTyping.value = true;
    
    // Simulate AI response
    Future.delayed(const Duration(seconds: 2), () {
      isTyping.value = false;
      
      // Add AI response
      messages.add(Message(
        text: _generateAIResponse(text, tag),
        isUser: false,
        timestamp: DateTime.now(),
      ));
      
      isSending.value = false;
    });
  }

  void sendQuickQuestion(String question, String tag) {
    sendMessage(question, tag: tag);
  }

  String _generateAIResponse(String userMessage, String? tag) {
    // Simple AI response generation based on tag or content
    if (tag != null) {
      switch (tag.toLowerCase()) {
        case 'math':
          return "I'd be happy to help you with mathematics! Let me break this down step by step with clear examples and explanations.";
        case 'physics':
          return "Great physics question! Let me explain this concept using real-world examples and fundamental principles.";
        case 'ai':
          return "Excellent question about AI! Let me explain how artificial intelligence works in simple terms with practical examples.";
        case 'science':
          return "Wonderful science question! I'll explain this concept clearly with examples from everyday life.";
        default:
          return "That's an interesting question! Let me provide you with a comprehensive explanation.";
      }
    }
    
    return "I'd be happy to help you with that! Let me provide a detailed explanation...";
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour == 0 
        ? 12 
        : dateTime.hour > 12 
            ? dateTime.hour - 12 
            : dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}