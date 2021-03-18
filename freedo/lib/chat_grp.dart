import 'package:flutter/material.dart';

Color gradientStartColor = Color(0xFFE1BEE7);
Color primaryTextColor = Color(0xFFE1BEE7);
Color gradientEndColor = Color(0xFF7B1FA2);

class ChatGrp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListChat(),
    );
  }
}

class ListChat extends StatefulWidget {
  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  // Title List Here
  var data = [
    {
      "title": "Adventurer",
      "content": "ISFP-A / ISFP-T",
      "image": "images/adventurer.jpg",
      "des": "Flexible and charming artists"
    },
    {
      "title": "Advocate",
      "content": "INFJ-A / INFJ-T",
      "image": "images/advocate.jpg",
      "des": "Quiet and mystical, yet very inspiring and tireless idealists"
    },
    {
      "title": "Architect",
      "content": "INTJ-A / INTJ-T",
      "image": "images/architect.jpg",
      "des": "Imaginative and strategic thinkers with a plan for everything"
    },
    {
      "title": "Cansul",
      "content": "ESFJ-A / ESFJ-T",
      "image": "images/cansul.jpg",
      "des":
          "Extraordinarily caring, social and popular people, always eager to help"
    },
    {
      "title": "Commander",
      "content": "ENTJ-A / ENTJ-T",
      "image": "images/commander.jpg",
      "des":
          "Bold, imaginative and strong-willed leader, always finding a way - or making one"
    },
    {
      "title": "Compaigner",
      "content": "ENFP-A / ENFP-T",
      "image": "images/compaigner.jpg",
      "des":
          "Enthusiastic, creative and sociable free spirits, who can always find a reason to smile"
    },
    {
      "title": "Debater",
      "content": "ENTP-A / ENTP-T",
      "image": "images/debater.jpg",
      "des": "Smart and curious thinkers who resist an intellectual challenge"
    },
    {
      "title": "Defender",
      "content": "ISFJ-A / ISFJ-T",
      "image": "images/defender.jpg",
      "des":
          "Very dedicated and warm protectors, always ready to defend their loved ones"
    },
    {
      "title": "Entrepreneur",
      "content": "ESTP-A / ESTP-T",
      "image": "images/Enterpreneur.jpg",
      "des": "Smart intelligent and very perspective people"
    },
    {
      "title": "Entertainer",
      "content": "ESFP-A / ESFP-T",
      "image": "images/Entertainer.jpg",
      "des": "Spontaneous, energetic and enthusiastic people"
    },
    {
      "title": "Executive",
      "content": "ESTJ-A / ESTJ-T",
      "image": "images/executive.jpg",
      "des":
          "Excellent administrators, unsarpassed at managing things- or people"
    },
    {
      "title": "Logician",
      "content": "ISTJ-A / ISTJ-T",
      "image": "images/logician.jpg",
      "des": "Innovative inventors with an unquenchable thirst for knowledge",
    },
    {
      "title": "Mediator",
      "content": "INFP-A / INFP-T",
      "image": "images/mediator.jpg",
      "des":
          "Poetic, kind and altruistic people,always eager to help a good cause"
    },
    {
      "title": "Protagonist",
      "content": "ENFJ-A / ENFJ-T",
      "image": "images/protagonist.jpg",
      "des":
          "Charismatic and inspiring leaders, able to mesmerize their listeners"
    },
    {
      "title": "Virtuosa",
      "content": "ISTP-A / ISTP-T",
      "image": "images/virtuoso.jpg",
      "des": "Bold and practical experimenters"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      backgroundColor: Colors.purple[200],
      // Main List View With Builder
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, data[index]["image"],
                  data[index]["title"], data[index]["des"]);
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(data[index]["image"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data[index]["title"],
                          style: TextStyle(
                            fontFamily: 'Amatic SC',
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

showDialogFunc(context, img, title, desc) {
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
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Amatic SC',
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amatic SC',
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
