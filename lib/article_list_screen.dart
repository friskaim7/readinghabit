import 'package:flutter/material.dart';
import 'package:readinghabit/article_detail_screen.dart';
import 'package:readinghabit/model/article_list.dart';

class ArticleListScreen extends StatelessWidget {
  final String screenName;
  final bool isFav;
  const ArticleListScreen(
      {Key? key, required this.screenName, required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenName),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return ArticleList(
              isFav: isFav,
            );
          } else if (constraints.maxWidth <= 1200) {
            return ArticleGrid(
              gridCount: 4,
              isFav: isFav,
            );
          } else {
            return ArticleGrid(
              gridCount: 6,
              isFav: isFav,
            );
          }
        },
      ),
    );
  }
}

List<Article> newList = articleList;

class ArticleList extends StatelessWidget {
  final bool isFav;

  const ArticleList({Key? key, required this.isFav}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        newList = articleList;
        if (isFav) {
          newList = articleList.where((x) => x.isFavorite).toList();
        }
        final Article article = newList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ArticleDetailScreen(article: article);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(article.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          article.title,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(article.category),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: newList.length,
    );
  }
}

class ArticleGrid extends StatelessWidget {
  final int gridCount;
  final bool isFav;

  const ArticleGrid({Key? key, required this.gridCount, required this.isFav})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    newList = articleList;
    if (isFav) {
      newList = articleList.where((x) => x.isFavorite).toList();
    }
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: newList.map((article) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ArticleDetailScreen(article: article);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      article.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      article.category,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
