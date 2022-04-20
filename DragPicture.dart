import 'package:flutter/material.dart';
import 'package:flutter_course_project/Transition/AnimalProfile.dart';
import 'package:flutter_course_project/Transition/Animals.dart';
import 'package:flutter_course_project/Transition/Tag.dart';
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
  final ValueNotifier<Swipe> swipeNotify;

  @override
  State<DragPicture> createState() => _DragPictureState();
}

class _DragPictureState extends State<DragPicture> {
  // Swipe from main.dart to move left and right
  ValueNotifier<Swipe> swipeNotify = ValueNotifier(Swipe.none);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.num,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: swipeNotify,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: swipe != Swipe.none
                    ? swipe == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    AnimalProfile(animals: widget.animals),
                    swipe != Swipe.none
                        ? swipe == Swipe.right
                            ? Positioned(
                                top: 40,
                                left: 20,
                                child: Transform.rotate(
                                  angle: 12,
                                  child: Tag(
                                    text: 'WINNER',
                                    dye: Colors.green[400]!,
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 50,
                                right: 24,
                                child: Transform.rotate(
                                  angle: -12,
                                  child: Tag(
                                    text: 'LOSER',
                                    dye: Colors.red[400]!,
                                  ),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          // When Draggable widget is dragged right
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            swipeNotify.value = Swipe.right;
          }
          // When Draggable widget is dragged left
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            swipeNotify.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotify.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        child: AnimalProfile(animals: widget.animals),
      ),
    );
  }
}
