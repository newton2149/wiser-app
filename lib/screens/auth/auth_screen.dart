import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wiser/utils/utils.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('#DEF4C6'),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // Set container height to the screen height
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Space between content and footer
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Wiser',
                          style: TextStyle(
                            fontFamily: 'Sedan',
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 9, 27, 15),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50), // Adding some spacing after title

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    margin: const EdgeInsets.only(bottom: 40.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Get financial analysis done\n',
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                          TextSpan(
                            text: 'with Wiser',
                            style: TextStyle(
                              fontFamily: 'Sedan',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 9, 27, 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Enter your email address to get started',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromARGB(255, 9, 27, 15),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 9, 27, 15),
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 9, 27, 15),
                                      width: 2.0),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle email continue action here
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                },
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black.withOpacity(0.5),
                                  backgroundColor:
                                      const Color.fromARGB(255, 9, 27, 15),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 20.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Continue with Email',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromRGBO(222, 255, 132, 1)),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("or",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 27, 15))),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Handle Google sign-in
                            },
                            icon: Image.asset('assets/images/google.png',
                                width: 25, height: 25),
                            label: const Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromARGB(255, 9, 27, 15)),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 9, 27, 15),
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'By continuing, you agree to Hiveberry Co\'s\n',
                        ),
                        TextSpan(
                          text: 'Consumer Terms',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Consumer Terms link tap
                            },
                        ),
                        const TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Usage Policy',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Usage Policy link tap
                            },
                        ),
                        const TextSpan(
                          text: ', and\nacknowledge their ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle Privacy Policy link tap
                            },
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),

              // Hiveberry Co. at the bottom
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
                child: Text(
                  "Hiveberry Co.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 27, 15),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
