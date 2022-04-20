import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          //borderRadius: BorderRadius.only(
          //bottomLeft: Radius.circular(64),
          //bottomRight: Radius.circular(64)),
        ),
        gradient: LinearGradient(
          colors: <Color>[Colors.deepPurple, Colors.grey],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(60),
        child: Text(
          "Anima",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.normal,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
