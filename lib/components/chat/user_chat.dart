import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.user,
    required this.message,
  });

  final String user;
  final String message;

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 5, top: 5),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          const Text(
            "Navneeth",
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 5),
          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth *
                  0.65, // Set max width to half of the screen width
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 9, 27, 15),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                // BoxShadow(
                //   color: Colors.black.withOpacity(0.5),
                //   spreadRadius: 2,
                //   blurRadius: 7,
                //   offset: const Offset(0, 3), // Changes position of shadow
                // ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
