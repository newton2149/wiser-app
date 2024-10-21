import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:wiser/models/chat_message.dart';

class DbProvider with ChangeNotifier {
  late Db _db;
  late DbCollection _collection;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  DbProvider() {}

  Future<void> init() async {
    try {
      // Replace with your actual connection string
      _db = await Db.create(
          "mongodb+srv://mongo:Appu9677@wiser-chat.mongocluster.cosmos.azure.com/?tls=true&authMechanism=SCRAM-SHA-256&retrywrites=false&maxIdleTimeMS=120000");
      await _db.open();
      _collection = _db.collection('session');
      _isConnected = true;
      notifyListeners(); // Notify that the connection is established
    } catch (e) {
      print('Error connecting to MongoDB: $e');
      if (e is MongoDartError) {
        print('MongoDart Error Message: ${e.message}');
      }
      _isConnected = false;
      notifyListeners();
    }
  }

  Future<void> close() async {
    await _db.close();
    _isConnected = false;
    notifyListeners();
  }

  Future<void> storeConversation(ChatMessage message) async {
    try {
      await _collection.insertOne(message.toJson());
      notifyListeners(); // Notify listeners in case the UI needs to react
    } catch (e) {
      print('Error storing conversation: $e');
    }
  }

  // Future<List<String>> retrieveAllSessionIds() async {
  //   try {
  //     final result = await _collection.distinct('sessionId');
  //     return List<String>.from(result);
  //   } catch (e) {
  //     print('Error retrieving session IDs: $e');
  //     return [];
  //   }
  // }

  Future<List<ChatMessage>> retrieveMessages(String sessionId) async {
    try {
      final messages =
          await _collection.find(where.eq('sessionId', sessionId)).toList();
      return messages.map((message) => ChatMessage.fromJson(message)).toList();
    } catch (e) {
      print('Error retrieving messages: $e');
      return [];
    }
  }
}
