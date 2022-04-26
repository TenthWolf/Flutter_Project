import 'package:flutter/material.dart';
import 'package:flutter_course_project/Transition/AnimalProfile.dart';
import 'package:flutter_course_project/Transition/Animals.dart';
import 'package:flutter_course_project/Transition/Letter.dart';
import 'package:flutter_course_project/Transition/main.dart';

class DragPicture extends StatefulWidget {
  const DragPicture(
      {Key? key,
      required this.animals,
      required this.num,
      required this.swipeNotify})
      : super(key: key);

// all of them will be declared final if not the class will have an error
  final Animals animals;
  final int num;
  final ValueNotifier<Drag> swipeNotify;

  @override
  State<DragPicture> createState() => _DragPictureState();
}

class _DragPictureState extends State<DragPicture> {
  ValueNotifier<Drag> swipeNotifier = ValueNotifier(Drag.none);

  // the dragging funcitonality that will move the pictures
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        data: widget.num,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (move, swipe, _) {
              return RotationTransition(
                turns: swipe != Drag.none
                    ? swipe == Drag.left
                        ? const AlwaysStoppedAnimation(-60 / 360)
                        : const AlwaysStoppedAnimation(60 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    AnimalProfile(animals: widget.animals),
                    swipe != Drag.none
                        ? swipe == Drag.right
                            ? Positioned(
                                top: 35,
                                left: 20,
                                child: Transform.rotate(
                                  angle: 12,
                                  child: Letter(
                                      text: 'WINNER', dye: Colors.green[400]!),
                                ),
                              )
                            : Positioned(
                                top: 40,
                                right: 20,
                                child: Transform.rotate(
                                  angle: -12,
                                  child: Letter(
                                      text: 'LOSER', dye: Colors.red[400]!),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),

        // movement when dragging widget to left
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Drag.right;
          }
          // movement when dragging widget to left
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Drag.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotifier.value = Drag.none;
        },
        childWhenDragging: Container(
          color: Colors.transparent,
        ),
        child: AnimalProfile(animals: widget.animals),
      ),
    );
  }
}
