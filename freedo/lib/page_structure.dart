import 'dart:io';
import 'dart:math' show pi;
import 'package:freedo/chat_grp.dart';
import 'package:freedo/aboutus/about_us.dart';
import 'package:freedo/notifications/notification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freedo/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freedo/menu_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:freedo/personality_test.dart';

class PageStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Color backgroundColor;
  final double elevation;

  const PageStructure({
    Key key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = ZoomDrawer.isRTL() ? 180 * pi / 180 : 0.0;
    final _currentPage =
        context.select<MenuProvider, int>((provider) => provider.currentPage);
    final color = Colors.deepPurple;
    final style = TextStyle(color: color);
    if (HomeScreen.mainMenu[_currentPage].title == "Personality Test") {
      return PlatformScaffold(
          backgroundColor: Colors.white,
          appBar: PlatformAppBar(
            backgroundColor: Colors.deepPurple,
            automaticallyImplyLeading: false,
            android: (_) => MaterialAppBarData(
                elevation: elevation, backgroundColor: Colors.deepPurple),
            title: PlatformText(
              HomeScreen.mainMenu[_currentPage].title,
              style: TextStyle(
                  fontFamily: 'Amatic SC',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            leading: Transform.rotate(
              angle: angle,
              child: PlatformIconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  ZoomDrawer.of(context).toggle();
                },
              ),
            ),
            trailingActions: actions,
          ),
          body: Personality());
    } else if (HomeScreen.mainMenu[_currentPage].title == "chats") {
      return PlatformScaffold(
          backgroundColor: Colors.white,
          appBar: PlatformAppBar(
            automaticallyImplyLeading: false,
            android: (_) => MaterialAppBarData(
                elevation: elevation, backgroundColor: Colors.deepPurple),
            title: PlatformText(
              HomeScreen.mainMenu[_currentPage].title,
              style: TextStyle(
                  fontFamily: 'Amatic SC',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            leading: Transform.rotate(
              angle: angle,
              child: PlatformIconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  ZoomDrawer.of(context).toggle();
                },
              ),
            ),
            trailingActions: actions,
          ),
          body: ChatGrp());
    } else if (HomeScreen.mainMenu[_currentPage].title == "about_us") {
      return PlatformScaffold(
          backgroundColor: Colors.white,
          appBar: PlatformAppBar(
            automaticallyImplyLeading: false,
            android: (_) => MaterialAppBarData(
                elevation: elevation, backgroundColor: Colors.deepPurple),
            title: PlatformText(
              HomeScreen.mainMenu[_currentPage].title,
              style: TextStyle(
                  fontFamily: 'Amatic SC',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            leading: Transform.rotate(
              angle: angle,
              child: PlatformIconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  ZoomDrawer.of(context).toggle();
                },
              ),
            ),
            trailingActions: actions,
          ),
          body: AbboutUs());
    } else if (HomeScreen.mainMenu[_currentPage].title == "notifications") {
      return PlatformScaffold(
          backgroundColor: Colors.white,
          appBar: PlatformAppBar(
            automaticallyImplyLeading: false,
            android: (_) => MaterialAppBarData(
                elevation: elevation, backgroundColor: Colors.deepPurple),
            title: PlatformText(
              HomeScreen.mainMenu[_currentPage].title,
              style: TextStyle(
                  fontFamily: 'Amatic SC',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            leading: Transform.rotate(
              angle: angle,
              child: PlatformIconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  ZoomDrawer.of(context).toggle();
                },
              ),
            ),
            trailingActions: actions,
          ),
          body: NotiFication());
    } else
      return PlatformScaffold(
        backgroundColor: Colors.white,
        appBar: PlatformAppBar(
          automaticallyImplyLeading: false,
          android: (_) => MaterialAppBarData(
              elevation: elevation, backgroundColor: Colors.deepPurple),
          title: PlatformText(
            HomeScreen.mainMenu[_currentPage].title,
            style: TextStyle(
                fontFamily: 'Amatic SC',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          leading: Transform.rotate(
            angle: angle,
            child: PlatformIconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                ZoomDrawer.of(context).toggle();
              },
            ),
          ),
          trailingActions: actions,
        ),
        body: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.blueGrey,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      );
  }
}
