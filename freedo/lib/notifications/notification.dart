import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freedo/api/pdf_api.dart';
import 'package:freedo/page/pdfview.dart';

Color gradientStartColor = Color(0xFFE1BEE7);
Color primaryTextColor = Color(0xFFE1BEE7);
Color gradientEndColor = Color(0xFF7B1FA2);

//class NotiFication extends StatelessWidget {
class NotiFication extends StatefulWidget {
  @override
  _NotiFicationState createState() => _NotiFicationState();
}

class _NotiFicationState extends State<NotiFication> {
  var data = [
    {
      "title": "Cryptocurrency is the future",
      "image": "images/adventurer.jpg",
    },
    {
      "title": "what's for women in budget 2k21",
      "image": "images/advocate.jpg",
    },
    {
      "title": "How to in invest in mutual funds",
      "image": "images/advocate.jpg",
    },
    {
      "title": "How to in invest in mutual funds",
      "image": "images/advocate.jpg",
    },
    {
      "title": "What is Stock Market",
      "image": "assets/stock.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            child: GestureDetector(
                              onTap: () async {
                                final url =
                                    'https://www.bis.org/events/eopix_1810/chiu_paper.pdf';
                                final file = await PDFApi.loadNetwork(url);
                                openPDF(context, file);
                              },
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(data[index]["image"]),
                                  ),
                                  Text(
                                    data[index]["title"],
                                    style: TextStyle(
                                      fontFamily: 'Amatic SC',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
