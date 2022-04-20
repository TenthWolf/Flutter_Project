import 'package:flutter/material.dart';
import 'package:flutter_course_project/Transition/Animals.dart';

class AnimalProfile extends StatelessWidget {
  const AnimalProfile({Key? key, required this.animals}) : super(key: key);
  final Animals animals;

  //Creation of storing the picture widget
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: Image.asset(animals.picture),
            ),
          ),

          // The layout of the widget
          Positioned(
            child: Container(
              height: 50,
              width: 300,
              decoration: const ShapeDecoration(
                color: Colors.white12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),

              //Creation of the Textfields for the animals name and what kind of breed
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      animals.name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      animals.breed,
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
