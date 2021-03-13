import 'dart:io';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'member.dart';

Color gradientStartColor = Color(0xFFE1BEE7);
Color primaryTextColor = Color(0xFFE1BEE7);
Color gradientEndColor = Color(0xFF7B1FA2);

class AbboutUs extends StatefulWidget {
  @override
  _AbboutUsState createState() => _AbboutUsState();
}

class _AbboutUsState extends State<AbboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Made with 🖤 by Team min(i,ons) ',
                      style: TextStyle(
                        fontFamily: 'Amatic SC',
                        fontSize: 20,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Team Members ',
                        style: TextStyle(
                          fontFamily: 'Amatic SC',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: member.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 90),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 80),
                                    Text(
                                      member[index].name,
                                      style: TextStyle(
                                        fontFamily: 'Amatic SC',
                                        fontSize: 38,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      ' Sophamore at IIITA',
                                      style: TextStyle(
                                        fontFamily: 'Amatic SC',
                                        fontSize: 25,
                                        color: const Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 32),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: FaIcon(
                                                FontAwesomeIcons.facebook),
                                            iconSize: 30,
                                            onPressed: () {
                                              if (member[index].name ==
                                                  "Shruti Nanda") {
                                                launch(
                                                    'https://www.facebook.com/shruti.nanda.735/');
                                              }
                                              if (member[index].name ==
                                                  "Naina Kumari") {
                                                launch(
                                                    'https://www.facebook.com/profile.php?id=100040156607949');
                                              }
                                              if (member[index].name ==
                                                  "Pavika Chaudhary") {
                                                launch(
                                                    'https://www.facebook.com/pavika.chaudhary.7');
                                              }
                                            }),
                                        IconButton(
                                            icon:
                                                FaIcon(FontAwesomeIcons.github),
                                            iconSize: 30,
                                            onPressed: () {
                                              if (member[index].name ==
                                                  "Shruti Nanda") {
                                                launch(
                                                    'https://github.com/Saggittarius-A/');
                                              }
                                              if (member[index].name ==
                                                  "Naina Kumari") {
                                                launch(
                                                    'https://github.com/naina24/');
                                              }
                                              if (member[index].name ==
                                                  "Pavika Chaudhary") {
                                                launch(
                                                    'https://github.com/CadencePrestissimo/');
                                              }
                                            }),
                                        IconButton(
                                            icon: FaIcon(
                                                FontAwesomeIcons.linkedin),
                                            iconSize: 30,
                                            onPressed: () {
                                              if (member[index].name ==
                                                  "Shruti Nanda") {
                                                launch(
                                                    'https://www.linkedin.com/in/shruti-nanda-00b2101a4/');
                                              }
                                              if (member[index].name ==
                                                  "Naina Kumari") {
                                                launch(
                                                    'https://www.linkedin.com/in/naina-kumari-8b39951a3/');
                                              }
                                              if (member[index].name ==
                                                  "Pavika Chaudhary") {
                                                launch(
                                                    'https://www.linkedin.com/in/pavika-chaudhary-1b620a1a4/');
                                              }
                                            }),
                                        IconButton(
                                            icon: FaIcon(
                                                FontAwesomeIcons.instagram),
                                            iconSize: 30,
                                            onPressed: () {
                                              if (member[index].name ==
                                                  "Shruti Nanda") {
                                                launch(
                                                    'https://www.instagram.com/__sagittarius_a/');
                                              }
                                              if (member[index].name ==
                                                  "Naina Kumari") {
                                                launch(
                                                    'https://www.instagram.com/kri_naina/');
                                              }
                                              if (member[index].name ==
                                                  "Pavika Chaudhary") {
                                                launch(
                                                    'https://www.instagram.com/_pavika__/');
                                              }
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: member[index].position,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Image.asset(member[index].iconImage),
                          ),
                        ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            member[index].position.toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 200,
                              color: primaryTextColor.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        //Image.asset(member[index].iconImage),
                        //Image.asset('assets/images/freedo.png'),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'copyright ©2021 ',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
