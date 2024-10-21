class ChatMessage {
  final String userId;
  final String sessionId;
  final String message;
  final String role;
  final DateTime timestamp;

  ChatMessage({
    required this.userId,
    required this.sessionId,
    required this.message,
    required this.role,
    required this.timestamp,
  });

  // Factory constructor to create a ChatMessage from JSON
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      userId: json['user_id'],
      sessionId: json['session_id'],
      message: json['message'],
      role: json['role'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'session_id': sessionId,
      'message': message,
      'role': role,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
