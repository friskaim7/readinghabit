import 'package:flutter/material.dart';
// import 'package:readinghabit/article_list_screen.dart';
import 'package:readinghabit/homescreen.dart';
// import 'package:readinghabit/model/article_list.dart' as globals;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading Habit',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const TabBarDemo(),
    );
  }
}
