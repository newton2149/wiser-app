import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const routeName = '/settings';

  Widget returnTextButton(
      {required String text, required IconData icon, required Function onTap}) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 9, 27, 15)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 27, 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Settings',
          style: TextStyle(
              fontFamily: 'Lemon',
              fontWeight: FontWeight.w100,
              fontSize: 16,
              color: Color.fromARGB(255, 9, 27, 15)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 9, 27, 15),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('navneeth0112@gmail.com',
                      style: TextStyle(color: Color.fromARGB(255, 9, 27, 15))),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 9, 27, 15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('free',
                      style: TextStyle(color: Colors.white, fontSize: 8)),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 9, 27, 15),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Get 5X more usage with premium',
                      style: TextStyle(color: Color.fromARGB(255, 9, 27, 15))),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 27, 15),
                  ),
                  child: const Text(
                    'Upgrade to Pro',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Your code here
              Navigator.of(context).pushReplacementNamed('/auth');
            },
            child: Row(
              children: [
                const Icon(Icons.person_rounded,
                    color: Color.fromARGB(255, 9, 27, 15)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Profile',
                      style: TextStyle(color: Color.fromARGB(255, 9, 27, 15))),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Your code here
              Navigator.of(context).pushReplacementNamed('/auth');
            },
            child: Row(
              children: [
                const Icon(Icons.monetization_on,
                    color: Color.fromARGB(255, 9, 27, 15)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text('Billing',
                      style: TextStyle(color: Color.fromARGB(255, 9, 27, 15))),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // Your code here
              Navigator.of(context).pushReplacementNamed('/auth');
            },
            child: Row(
              children: [
                const Icon(Icons.logout, color: Colors.red),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 27, 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
