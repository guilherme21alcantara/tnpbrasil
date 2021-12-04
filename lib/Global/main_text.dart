import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';

class MainText extends StatelessWidget {
  final String text;
  final double font;
  final Color color;
  const MainText({
    Key? key,
    required this.text,
    required this.font,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text
    .rich(TextSpan(
   text:text,
      style: TextStyle(
          color: color, fontSize: font.sp, fontWeight: FontWeight.w700),
    ));
  }
}
