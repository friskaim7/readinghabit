import 'package:flutter/material.dart';
import 'package:readinghabit/model/article_list.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class ArticleDetailScreen extends StatefulWidget {
  final Article article;

  const ArticleDetailScreen({Key? key, required this.article})
      : super(key: key);

  @override
  LightState createState() => LightState();
}

class LightState extends State<ArticleDetailScreen> {
  bool isLight = true;
  Color backgroundColor = Colors.white;
  Color fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(widget.article.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: backgroundColor,
                          child: IconButton(
                            icon: Icon(
                              isLight? Icons.brightness_4 : Icons.brightness_2,
                              color: fontColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isLight = !isLight;
                                if(isLight){
                                  backgroundColor = Colors.white;
                                  fontColor = Colors.black;
                                }
                                else{
                                  backgroundColor = Colors.black;
                                  fontColor = Colors.white;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.article.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                  color: fontColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.article.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                  color: fontColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
