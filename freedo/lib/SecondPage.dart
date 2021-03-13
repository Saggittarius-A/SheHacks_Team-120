import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class SecondPage extends StatefulWidget {
  static const String id = 'SecondPage';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<SecondPage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ZoomDrawer(
          controller: ZoomDrawerController(),
          menuScreen: null,
          mainScreen: null,
          borderRadius: 24.0,
          showShadow: true,
          angle: -12.0,
          backgroundColor: Colors.grey[300],
          slideWidth: MediaQuery.of(context).size.width*.65,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
        )
    );
  }
}