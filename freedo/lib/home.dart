import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:freedo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const String id='Home';
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Zoom Drawer Demo',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => MenuProvider(),
        child: HomeScreen(),
      ),
    );
  }
}