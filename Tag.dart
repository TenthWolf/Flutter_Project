import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.text, required this.dye})
      : super(key: key);

  final String text;
  final Color dye;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: dye,
            width: 4,
          ),
          //borderRadius: BorderRadius.all(
          // Radius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: dye,
          fontSize: 36,
        ),
      ),
    );
  }
}
