import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiser/provider/chat_room_provider.dart';
import 'package:wiser/screens/chat/chat_view.dart';

class ChatCard extends StatelessWidget {
  final int index;
  const ChatCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final chatRoom = Provider.of<ChatRoom>(context);

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 9, 27, 15),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          print("calliong api");
          String sessionId = "0c5c4660-7afe-4c81-851f-2fbabae22fe8";
          final listMessage = chatRoom
              .fetch(sessionId)
              .then((value) {
            value.forEach(chatRoom.addMessageLocal);
            Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatView(
                            title: "text", sessionId: sessionId, token: "token"),
                      ),
                    );
          });

          // Navigator.of(context).push(MaterialPageRoute(builder:  (context) => ChatView()));
        },
        title: Text("Tata Steel Stock Analysis $index",
            style: TextStyle(
              fontFamily: 'Lemon',
              fontSize: 16,
              color: Theme.of(context).canvasColor,
            )),
        subtitle: Text("13 hrs ago",
            style: TextStyle(
              fontFamily: 'Lemon',
              fontSize: 12,
              color: Theme.of(context).canvasColor,
            )),
      ),
    );
  }
}
