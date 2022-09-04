import 'package:flutter/material.dart';
import 'package:readinghabit/article_list_screen.dart';
import 'package:readinghabit/model/article_list.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen', fontSize: 16);
var numberStyle = const TextStyle(
    fontFamily: 'Oxygen', fontSize: 45, fontWeight: FontWeight.bold);
var paddingSize = 20.0;

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_rounded)),
                Tab(icon: Icon(Icons.favorite)),
                Tab(icon: Icon(Icons.article)),
              ],
            ),
            title: const Text('Reading Habit'),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              ArticleListScreen(
                screenName: 'Favorite Articles',
                isFav: true,
              ),
              ArticleListScreen(
                screenName: 'All Articles',
                isFav: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // newList = articleList;
    newList = articleList.where((x) => x.isFavorite).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Summary'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.book, size: 50),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('17', style: numberStyle)
                            ]),
                        Text(
                          'Read Articles',
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.favorite, size: 50),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('${newList.length}', style: numberStyle)
                            ]),
                        Text(
                          'Favorite Articles',
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(paddingSize),
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Icon(Icons.access_time, size: 50),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('2.5 hours', style: numberStyle)
                            ]),
                        Text(
                          'Read Duration',
                          style: informationTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
