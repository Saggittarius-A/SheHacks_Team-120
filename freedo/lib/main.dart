import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freedo/SecondPage.dart';
import 'package:freedo/FirstPage.dart';
import 'package:freedo/delayed_animation.dart';


void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirstPage.id,
      routes: {
        FirstPage.id: (context) => FirstPage(),
        SecondPage.id: (context) => SecondPage(),
      },
    );
  }
}