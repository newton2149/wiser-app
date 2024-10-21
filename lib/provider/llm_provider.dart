import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LLMProvider with ChangeNotifier {

  final String apiUrl = 'http://192.168.49.1:8000/chat/analyse';


Future<Map<String, dynamic>> analyseReply(String prompt, String apiUrl , String sessionId, String token) async {

  final url = Uri.parse('http://192.168.49.1:8000/chat/reply/analyse');

  Map<String, dynamic> requestBody = {
    "username":"newton2149",
    'prompt': prompt,
    'session_id': sessionId
  };

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Add token if required for auth
      },
      body: jsonEncode(requestBody),
    );

    Map<String, dynamic> result = {
      'sessionId': null,
      'responseBody': null,
      'statusCode': response.statusCode,
    };

    if (response.statusCode == 200) {
      String? newSessionId = response.headers['x-session-id'];

      result['sessionId'] = newSessionId;

      result['responseBody'] = jsonDecode(response.body);

      debugPrint('Session ID: $newSessionId');
      debugPrint('Response body: ${response.body}');
    } else {
      debugPrint('Failed to call API. Status code: ${response.statusCode}');
    }

    // Return the result with sessionId and responseBody
    return result;

  } catch (e) {
    debugPrint('Error occurred while calling the API: $e');

    // Return an error response
    return {
      'error': e.toString(),
      'statusCode': null,
    };
  }
}



Future<Map<String, dynamic>> analyse(String prompt, String apiUrl, String token) async {

  final url = Uri.parse('http://192.168.49.1:8000/chat/analyse');

  Map<String, dynamic> requestBody = {
    "username":"newton2149",
    'prompt': prompt,
  };

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


}
