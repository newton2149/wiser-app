import 'package:flutter/material.dart';
import 'package:wiser/utils/utils.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

   static const routeName = '/intro/splash';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 207, 95),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_splash.png",
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Wiser',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: HexColor.fromHex('#DEF4C6'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
            child: Text(
              "Hiveberry Co.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
