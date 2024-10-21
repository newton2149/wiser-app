import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiser/components/chart_card.dart';
import 'package:wiser/models/chat_message.dart';
import 'package:wiser/provider/chat_room_provider.dart';
import 'package:wiser/screens/chat/chat_view.dart';
import 'package:wiser/utils/utils.dart';

import '../provider/chat_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const routeName = '/home';
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final chatRoom = Provider.of<ChatRoom>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Wiser',
            style: TextStyle(
                fontFamily: 'Sedan',
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                // Your code here
                Navigator.of(context).pushNamed('/settings');
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: const Text("N",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${getGreetingMessage()},\n',
                                  style: TextStyle(
                                      fontFamily: 'Lemon',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w100,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                TextSpan(
                                    text: 'Navneeth',
                                    style: TextStyle(
                                        fontFamily: 'Lemon',
                                        fontStyle: FontStyle.italic,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w100,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(177, 207, 95, 1),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Limited Number of Chats",
                                  style: TextStyle(
                                    fontFamily: 'Lemon',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              TextButton(
                                onPressed: () {},
                                child: Text("- Upgrade to Pro",
                                    style: TextStyle(
                                      fontFamily: 'Lemon',
                                      fontSize: 13,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Latest News",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Lemon',
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "See All",
                                    style: TextStyle(
                                        color: Color.fromRGBO(3, 48, 18, 1),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10, top: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 9, 27, 15),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tata Steel",
                                    style: TextStyle(
                                        color: HexColor.fromHex('#DEF4C6'),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "13 hrs ago",
                                    style: TextStyle(
                                        color: HexColor.fromHex('#DEF4C6'),
                                        fontSize: 10),
                                  )
                                ],
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Benchmark Sensex reversed its early gains to close lower by 398 points on Wednesday amid weak global trends. In today's trade, shares ",
                                    style: TextStyle(
                                        color: HexColor.fromHex('#DEF4C6'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          alignment: Alignment.centerLeft,
                          child: Text("My Analysis",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Lemon',
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ChatCard(index: index);
                    },
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
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
                      hintText: 'Chat with WiserGPT',
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
                    if (text.isEmpty) {
                      return;
                    }
                    String sessionId = chatProvider.createSession("newton2149");

                    chatRoom.setSessionId(sessionId);

                    ChatMessage message = chatProvider.createChatMessage(
                        "newton2149", text, sessionId, "user", DateTime.now());

                    chatRoom.addMessage(message);
                    chatRoom.inference(message);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ChatView(
                            title: text, sessionId: sessionId, token: "token"),
                      ),
                    );

                    controller.clear();
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
