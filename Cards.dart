import 'package:flutter/material.dart';
import 'package:flutter_course_project/Transition/Animals.dart';
import 'package:flutter_course_project/Transition/DragPicture.dart';
import 'package:flutter_course_project/Transition/main.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<Animals> dragPicture = [
    Animals(name: 'Corgi', breed: 'Dog', picture: 'assets/images/Dog.png'),
    Animals(name: 'Garfield', breed: 'Cat', picture: 'assets/images/Cat.png'),
    Animals(
        name: 'Bowser', breed: 'Lizard', picture: 'assets/images/Lizard.png'),
    Animals(
        name: 'Jerry', breed: 'Parrot', picture: 'assets/images/parrot.png'),
    Animals(
        name: 'Rufus', breed: 'Rabbit', picture: 'assets/images/rabbit.png'),
  ];

  ValueNotifier<Drag> dragNotifier = ValueNotifier(Drag.none);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: dragNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(dragPicture.length, (index) {
                return DragPicture(
                  animals: dragPicture[index],
                  num: index,
                  swipeNotify: dragNotifier,
                );
              }),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 400.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                dragPicture.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 400.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                dragPicture.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
