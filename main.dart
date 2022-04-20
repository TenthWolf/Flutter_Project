import 'package:flutter/material.dart';
import 'package:flutter_course_project/Transition/Cards.dart';
import 'package:flutter_course_project/Transition/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: const [
            Home(),
            Cards(),
          ],
        ),
      ),
    );
  }
}

enum Swipe { left, right, none }
