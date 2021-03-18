import 'dart:async';
import 'dart:ui' as ui;
import 'dart:math' show pi;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:freedo/chat_grp.dart';
import 'package:freedo/pages/home_page.dart';
import 'package:freedo/pages/search_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:like_button/like_button.dart';
import 'package:freedo/aboutus/about_us.dart';
import 'package:freedo/notifications/notification.dart';
import 'package:freedo/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:freedo/personality_test.dart';

class PageStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Color backgroundColor;
  final double elevation;

  PageStructure({
    Key key,
    this.title,
    this.child,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  List<String> image=[
    "https://i.ibb.co/cyjKDt7/Screenshot-357.png",
    "https://i.ibb.co/5h8NFvr/Screenshot-352.png",
    "https://i.ibb.co/94nmq43/Screenshot-356.png",
    "https://i.ibb.co/xq28ZNm/Screenshot-354.png",
    "https://i.ibb.co/hc6CsjF/Screenshot-353.png",
    "https://i.ibb.co/KzTsFw7/Screenshot-10.png",
    "https://i.ibb.co/5LhPwhv/Screenshot-12.png",
    "https://i.ibb.co/7tBLxPK/Screenshot-14.png",
    "https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1445023086979-7244a12345a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1532960401447-7dd05bef20b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=679&q=80",
    "https://images.unsplash.com/uploads/1412594480669535c9ef9/9d85c477?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1482235225574-c37692835cf3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1437954820769-76094033b90f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1469406396016-013bfae5d83e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1445023086979-7244a12345a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1485871981521-5b1fd3805eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1445023086979-7244a12345a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1532960401447-7dd05bef20b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=679&q=80",
    "https://images.unsplash.com/uploads/1412594480669535c9ef9/9d85c477?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1532960401447-7dd05bef20b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=679&q=80",
    "https://images.unsplash.com/uploads/1412594480669535c9ef9/9d85c477?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1499566727020-881da110a0b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
  ];


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
      return Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Groups', style: TextStyle(color: Colors.white, fontSize: 27.0, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.black87,
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  icon: Icon(Icons.search, color: Colors.white, size: 25.0),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
                  }
              )
            ],
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

          ),
          body: HomePage());
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
          body: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.white,
                  ),
                  child: StaggeredGridView.countBuilder(crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: image.length,
                      itemBuilder: (context,index){
                        return  GestureDetector(
                          onTap:() {
                            // This Will Call When User Click On ListView Item
                            showDialogFunc(context,image[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: image[index],fit: BoxFit.cover,),
                            ),
                          ),
                        );
                      }, staggeredTileBuilder:(index){
                        return new StaggeredTile.count(1,index.isEven ?1.2 : 1.0);
                      })
              ),
            ),

          )
      );
  }
}

showDialogFunc(context, img) {
  double s=0.0;
  s= _calculateImageDimension(img);
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 420,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    img,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LikeButton(
                  size:32,
                  circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.blueGrey,
                      size: 32,
                    );
                  },
                  likeCount: 0,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "love",
                        style: TextStyle(color: color),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                    return result;
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
double _calculateImageDimension(String img) {
  Completer<Size> completer = Completer();
  Image image = Image.network(img);
  var myImage;
  image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener(
          (ImageInfo image, bool synchronousCall) {
        myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return myImage.height.toDouble();
}
