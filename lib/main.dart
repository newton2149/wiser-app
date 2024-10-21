import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiser/provider/chat_provider.dart';
import 'package:wiser/provider/chat_room_provider.dart';
import 'package:wiser/provider/db_provider.dart';
import 'package:wiser/screens/auth/auth_screen.dart';
import 'package:wiser/screens/home.dart';
import 'package:wiser/screens/intro/splash.dart';
import 'package:wiser/screens/profile/setting_screen.dart';

void main() async {
  // Ensure that WidgetsFlutterBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Create instances of your providers and initialize them
  var dbProvider = DbProvider();
  // await dbProvider.init();

  runApp(MyApp(dbProvider: dbProvider));
}

class MyApp extends StatelessWidget {
  final DbProvider dbProvider;

  const MyApp({super.key, required this.dbProvider});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatRoom(context)),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider.value(value: dbProvider), // Use the initialized DbProvider
      ],
      child: MaterialApp(
        title: 'Wiser',
        theme: ThemeData(
          fontFamily: 'Lemon',
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
            ),
            bodyLarge: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          canvasColor: const Color.fromRGBO(224, 244, 202, 1),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(224, 244, 202, 1)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          AuthScreen.routeName: (context) => const AuthScreen(),
          SettingScreen.routeName: (context) => const SettingScreen(),
        },
      ),
    );
  }
}
