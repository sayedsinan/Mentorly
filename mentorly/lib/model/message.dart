
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? tag;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.tag,
  });
}