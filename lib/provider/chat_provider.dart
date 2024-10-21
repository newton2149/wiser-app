import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wiser/models/chat_message.dart';

class ChatProvider with ChangeNotifier {
  void delete() {}

  void rename() {}

  void fetch() {}

  void analyseReply() {}

  String createSession(String userId) {
    var uuid = const Uuid();
    String sessionId = uuid.v4();
    return sessionId;
  }

  ChatMessage createNewMessage(String userId, String message,
      String role, DateTime timestamp) {
    return ChatMessage(
      userId: userId,
      sessionId: createSession(userId),
      message: message,
      role: role,
      timestamp: timestamp,
    );
  }

  ChatMessage createChatMessage(String userId, String message,String sessionId,
      String role, DateTime timestamp) {
    return ChatMessage(
      userId: userId,
      sessionId: sessionId,
      message: message,
      role: role,
      timestamp: timestamp,
    );
  }


}
