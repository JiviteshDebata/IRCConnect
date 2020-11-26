import 'package:flutter/material.dart';
import 'package:irc_connect_app/pages/LoginPage.dart';
import 'package:irc_connect_app/pages/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of this application.
        // primarySwatch: Colors.blue,  // Not required
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Launch(),
    );
  }
}

class Launch extends StatelessWidget {
  Future checkNewIntsall(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _newinstall = (prefs.getBool('newinstall') ?? true);

    // Check if new install , go to splash_screen.dart
    if (_newinstall) {
      await prefs.setBool('newinstall', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkNewIntsall(context);
    return Scaffold();
  }
}
