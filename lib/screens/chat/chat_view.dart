import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiser/components/chat/response_chat.dart';
import 'package:wiser/components/chat/user_chat.dart';
import 'package:wiser/models/chat_message.dart';
import 'package:wiser/provider/chat_provider.dart';
import 'package:wiser/provider/chat_room_provider.dart';

class ChatView extends StatefulWidget {
  final String title;
  final String sessionId;
  final String token;

  const ChatView({
    super.key,
    required this.title,
    required this.sessionId,
    required this.token,
  });

  static const routeName = '/chat-view';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController controller = TextEditingController();
  ChatRoom? _chatRoom;

  @override
  void initState() {
    super.initState();
    // Start fetching messages when the widget is initialized
    // Provider.of<ChatRoom>(context, listen: false)
    //     .startFetching(widget.sessionId, widget.token);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Store the reference to the ChatRoom provider
    _chatRoom = Provider.of<ChatRoom>(context, listen: false);
  }

  @override
  void dispose() {
    // Use the stored reference without accessing context
    _chatRoom?.clearMessages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatRoom = Provider.of<ChatRoom>(context);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Lemon',
            fontSize: 16,
            color: Color.fromARGB(255, 9, 27, 15),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                1,
              ),
              color: const Color.fromARGB(255, 9, 27, 15),
              onSelected: (String value) {
                // Handle menu item selection
                switch (value) {
                  case 'Rename':
                    // Handle Option 1
                    break;
                  case 'Delete':
                    // Handle Option 2
                    break;
                  default:
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return <String>['Rename', 'Delete'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors
                            .transparent, // Set background color to transparent
                        // Text color
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            choice,
                            style: const TextStyle(
                              color: Color.fromRGBO(222, 255, 132, 1),
                            ),
                          ),
                          Icon(
                            choice == 'Rename' ? Icons.edit : Icons.delete,
                            size: 24,
                            color: const Color.fromRGBO(222, 255, 132, 1),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Consumer<ChatRoom>(
            builder: (context, value, child) => CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate:
                      SliverChildListDelegate(chatRoom.messages.map((message) {
                    if (message.role == 'user') {
                      // Display UserInput widget for user messages
                      return UserInput(
                        user: message.userId,
                        message: message.message,
                      );
                    } else if (message.role == 'ai') {
                      // Display ResponseWidget for AI responses with markdown content
                      return ResponseWidget(
                        markdown: message.message,
                      );
                    }
                    return const SizedBox
                        .shrink(); // Return an empty widget for other roles
                  }).toList()),
                ),
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(222, 255, 132, 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5.0,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: null, // Allows the TextField to grow vertically
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/icon.png'),
                      hintText: 'Reply to WiserGPT',
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Color.fromRGBO(3, 48, 18, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between TextField and Button
                ElevatedButton(
                  onPressed: () {
                    String text = controller.text;
                    if (text.isNotEmpty) {
                      // Add the user message to the chat room
                      ChatMessage message = chatProvider.createChatMessage(
                          "newton2149",
                          text,
                          widget.sessionId,
                          "user",
                          DateTime.now());

                      chatRoom.addMessage(message);

                      controller.clear(); // Clear the TextField after sending
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color.fromRGBO(3, 48, 18, 1),
                  ),
                  child: const Icon(
                    Icons.arrow_upward,
                    size: 24,
                    color: Color.fromRGBO(222, 255, 132, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
