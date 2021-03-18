import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freedo/SecondPage.dart';
import 'package:freedo/FirstPage.dart';
import 'package:freedo/home.dart';
import 'package:freedo/home_screen.dart';
import 'package:freedo/chat_grp.dart';
import 'package:freedo/pages/signin_page.dart';

import 'SecondPage.dart';

import 'package:flutter/material.dart';
import 'package:freedo/helper/helper_functions.dart';
import 'package:freedo/pages/authenticate_page.dart';
import 'package:freedo/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _getUserLoggedInStatus();
  }

  _getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      if(value != null) {
        setState(() {
          _isLoggedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Chats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      //home: _isLoggedIn != null ? _isLoggedIn ? HomePage() : AuthenticatePage() : Center(child: CircularProgressIndicator()),
      home: _isLoggedIn ? Home() : AuthenticatePage(),
      routes: {
        SignInPage.id: (context) => SignInPage(),
        // FirstPage.id: (context) => FirstPage(),
        Home.id: (context) => Home(),
        SecondPage.id: (context) => SecondPage(),
      },
      //home: HomePage(),
    );
  }
}
