import 'package:flutter/material.dart';

class TitleSing extends StatelessWidget {
  double top, left, right, bottom, fonte;
  FontWeight bold;
  String text;
  TitleSing(
      {Key? key,
      required this.top,
      required this.bottom,
      required this.right,
      required this.left,
      required this.bold,
      required this.fonte,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, right: right, left: left),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fonte,
          color: Colors.black,
          //inherit: false,
          fontWeight: bold,
        ),
      ),
    );
  }
}
