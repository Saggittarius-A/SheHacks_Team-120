import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

var COLORS = [
  Color(0xFFEF7A85),
  Color(0xFFFF90B3),
  Color(0xFFFFC2E2),
  Color(0xFFB892FF),
  Color(0xFFB892FF)
];

class Personality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Awesome List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data = [
    {
      "title": "Adventurer",
      "content": "ISFP-A / ISFP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/adventurer.jpg",
      "des" : "Flexible and charming artists"
    },
    {
      "title": "Advocate",
      "content": "INFJ-A / INFJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/advocate.jpg",
      "des" : "Quiet and mystical, yet very inspiring and tireless idealists"
    },
    {
      "title": "Architect",
      "content": "INTJ-A / INTJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/architect.jpg",
      "des": "Imaginative and strategic thinkers with a plan for everything"
    },
    {
      "title": "Cansul",
      "content": "ESFJ-A / ESFJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/cansul.jpg",
      "des" : "Extraordinarily caring, social and popular people, always eager to help"
    },
    {
      "title": "Commander",
      "content": "ENTJ-A / ENTJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/commander.jpg",
      "des" : "Bold, imaginative and strong-willed leader, always finding a way - or making one"
    },
    {
      "title": "Compaigner",
      "content": "ENFP-A / ENFP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/compaigner.jpg",
      "des" : "Enthusiastic, creative and sociable free spirits, who can always find a reason to smile"
    },
    {
      "title": "Debater",
      "content": "ENTP-A / ENTP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/debater.jpg",
      "des" : "Smart and curious thinkers who resist an intellectual challenge"
    },
    {
      "title": "Defender",
      "content": "ISFJ-A / ISFJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/defender.jpg",
      "des" : "Very dedicated and warm protectors, always ready to defend their loved ones"
    },
    {
      "title": "Entrepreneur",
      "content": "ESTP-A / ESTP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/Enterpreneur.jpg",
      "des" : "Smart intelligent and very perspective people"
    },
    {
      "title": "Entertainer",
      "content": "ESFP-A / ESFP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/Entertainer.jpg",
      "des" : "Spontaneous, energetic and enthusiastic people"
    },
    {
      "title": "Executive",
      "content": "ESTJ-A / ESTJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/executive.jpg",
      "des" : "Excellent administrators, unsarpassed at managing things- or people"
    },
    {
      "title": "Logician",
      "content": "ISTJ-A / ISTJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/logician.jpg",
      "des" : "Innovative inventors with an unquenchable thirst for knowledge",
    },
    {
      "title": "Mediator",
      "content": "INFP-A / INFP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/mediator.jpg",
      "des" : "Poetic, kind and altruistic people,always eager to help a good cause"
    },
    {
      "title": "Protagonist",
      "content": "ENFJ-A / ENFJ-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/protagonist.jpg",
      "des" : "Charismatic and inspiring leaders, able to mesmerize their listeners"
    },
    {
      "title": "Virtuosa",
      "content": "ISTP-A / ISTP-T",
      "color": COLORS[new Random().nextInt(5)],
      "image": "images/virtuoso.jpg",
      "des" : "Bold and practical experimenters"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          new Transform.translate(
            offset: new Offset(0.0, MediaQuery.of(context).size.height * 0.1050),
            child: new ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              primary: true,
              itemCount: data.length,
              itemBuilder: (BuildContext content, int index) {
                return AwesomeListItem(
                    title: data[index]["title"],
                    content: data[index]["content"],
                    color: data[index]["color"],
                    image: data[index]["image"],
                    des: data[index]["des"]);
              },
            ),
          ),

          new Transform.translate(
            offset: Offset(0.0, -56.0),
            child: new Container(
              child: new ClipPath(
                clipper: new MyClipper(),
                child: new Stack(
                  children: [
                    new Container(
                      color: Colors.deepPurple,
                    ),
                    new Opacity(
                      opacity: 0.2,
                      child: new Container(color: COLORS[0]),
                    ),
                    new Transform.translate(
                      offset: Offset(0.0, 50.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                        child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "To know your Personality",
                                    style: TextStyle(fontFamily: 'Amatic SC', fontSize: 35.0, fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: "     Click here",
                                      style: TextStyle(fontFamily: 'Amatic SC', fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()..onTap =  () async{
                                        var url = "https://www.16personalities.com/free-personality-test";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      }
                                  ),
                                ]
                            )),
                      )
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height / 4.75);
    p.lineTo(0.0, size.height / 3.75);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class AwesomeListItem extends StatefulWidget {
  String title;
  String content;
  Color color;
  String image;
  String des;

  AwesomeListItem({this.title, this.content, this.color, this.image, this.des});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(width: 10.0, height: 190.0, color: widget.color),
        new Expanded(
          child: new Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new RaisedButton(
                    color: Colors.deepPurple,
                    highlightColor: Colors.blue,
                    onPressed: () {},
                    child: Text(
                     widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Amatic SC',
                            fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                ),
                  new Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: new Text(
                  widget.content,
                  style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
                  ),
                  ),
                new Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: new Text(
                    widget.des,
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),

                ),
              ],
            ),
          ),
        ),
        new Container(
          height: 150.0,
          width: 150.0,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              new Transform.translate(
                offset: new Offset(50.0, 0.0),
                child: new Container(
                  height: 100.0,
                  width: 100.0,
                  color: widget.color,
                ),
              ),
              new Transform.translate(
                offset: Offset(10.0, 20.0),
                child: new Card(
                  elevation: 20.0,
                  child: new Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 10.0,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}