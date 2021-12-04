import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';

class Subtext extends StatelessWidget {
  final String text;
  final double font;

  const Subtext({
    Key? key,
    required this.text,
    required this.font,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppCores.darkgray,
        fontSize: font.sp,
      ),
    );
  }
}
