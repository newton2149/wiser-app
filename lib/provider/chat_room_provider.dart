import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wiser/models/chat_message.dart';
import 'package:http/http.dart' as http;

class ChatRoom with ChangeNotifier {
  final BuildContext context;

  ChatRoom(this.context);

  String sessionId = '';
  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJuZXd0b24yMTQ5IiwiZXhwIjoxNzI5NDMyNTk5fQ.cFurjQH81PAJWs3U0op6QZOyKSOkGBVm5UHZhNrrYoo";

  void setSessionId(String id) {
    sessionId = id;
  }

  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  Future<Map<String, dynamic>> inference(ChatMessage message) async {
    final url = Uri.parse('http://192.168.49.1:8000/chat/inference');

    Map<String, dynamic> requestBody = message.toJson();
  

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      Map<String, dynamic> result = {
        'sessionId': null,
        'responseBody': null,
        'statusCode': response.statusCode,
      };

      if (response.statusCode == 200) {
        String? sessionId = response.headers['x-session-id'];

        if (sessionId != null) {
          result['sessionId'] = sessionId;
          debugPrint('Session ID: $sessionId');
        } else {
          debugPrint('Session ID not found in response headers');
        }

        result['responseBody'] = jsonDecode(response.body);
        debugPrint('Response body: ${response.body}');
      } else {
        debugPrint('Failed to call API. Status code: ${response.statusCode}');
      }

      ChatMessage responseMessage = ChatMessage(
          message: result['responseBody']['message'],
          userId: message.userId,
          sessionId: message.sessionId,
          role: 'ai',
          timestamp: DateTime.now());
      addMessage(responseMessage);

      return result;
    } catch (e) {
      debugPrint('Error occurred while calling the API: $e');

      return {
        'error': e.toString(),
        'statusCode': null,
      };
    }
  }

  Future<Map<String, dynamic>> inferenceReply(ChatMessage message) async {
    final url = Uri.parse('http://192.168.49.1:8000/chat/inference-reply');

    Map<String, dynamic> requestBody = message.toJson();
   

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      Map<String, dynamic> result = {
        'sessionId': null,
        'responseBody': null,
        'statusCode': response.statusCode,
      };

      if (response.statusCode == 200) {
        String? sessionId = response.headers['x-session-id'];

        if (sessionId != null) {
          result['sessionId'] = sessionId;
          debugPrint('Session ID: $sessionId');
        } else {
          debugPrint('Session ID not found in response headers');
        }

        result['responseBody'] = jsonDecode(response.body);
        debugPrint('Response body: ${response.body}');
      } else {
        debugPrint('Failed to call API. Status code: ${response.statusCode}');
      }

      ChatMessage responseMessage = ChatMessage(
          message: result['responseBody']['message'],
          userId: message.userId,
          sessionId: message.sessionId,
          role: 'ai',
          timestamp: DateTime.now());
          
      addMessage(responseMessage);

      return result;
    } catch (e) {
      debugPrint('Error occurred while calling the API: $e');

      return {
        'error': e.toString(),
        'statusCode': null,
      };
    }
  }

  Future<Map<String, dynamic>> store(ChatMessage message) async {
    final url = Uri.parse('http://192.168.49.1:8000/chat/store');

    Map<String, dynamic> requestBody = message.toJson();
   
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      Map<String, dynamic> result = {
        'sessionId': null,
        'responseBody': null,
        'statusCode': response.statusCode,
      };

      if (response.statusCode == 200) {
        String? sessionId = response.headers['x-session-id'];

        if (sessionId != null) {
          result['sessionId'] = sessionId;
          debugPrint('Session ID: $sessionId');
        } else {
          debugPrint('Session ID not found in response headers');
        }

        result['responseBody'] = jsonDecode(response.body);
        debugPrint('Response body: ${response.body}');
      } else {
        debugPrint('Failed to call API. Status code: ${response.statusCode}');
      }

      return result;
    } catch (e) {
      debugPrint('Error occurred while calling the API: $e');

      return {
        'error': e.toString(),
        'statusCode': null,
      };
    }
  }

  Future<List<ChatMessage>> fetch(String sessionId) async {
    final url = Uri.parse('http://192.168.49.1:8000/user/fetch/$sessionId');


    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<ChatMessage> messages = jsonResponse
            .map((message) => ChatMessage.fromJson(message))
            .toList();

        debugPrint('Fetched messages: ${messages.length}');
        return messages;
      } else {
        debugPrint('Failed to call API. Status code: ${response.statusCode}');
        return []; // Return an empty list if the API call fails
      }
    } catch (e) {
      debugPrint('Error occurred while calling the API: $e');
      return []; // Return an empty list in case of an error
    }
  }

  void addMessage(ChatMessage message) async {
    _messages.add(message);
    store(message);

    notifyListeners();
  }

  void addMessageLocal(ChatMessage message) async {
    _messages.add(message);

    notifyListeners();
  }

  void clearMessages() {
    sessionId = '';
    _messages.clear();
    notifyListeners();
  }
}
