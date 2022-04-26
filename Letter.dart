import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  const Letter({Key? key, required this.text, required this.dye})
      : super(key: key);

  final String text;
  final Color dye;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: dye,
            width: 3,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: dye,
          fontSize: 30,
        ),
      ),
    );
  }
}
