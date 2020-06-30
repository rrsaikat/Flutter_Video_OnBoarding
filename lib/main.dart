import 'package:flutter/material.dart';
import 'package:flutteronboardui/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

