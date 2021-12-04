import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderLogo extends StatefulWidget {
  const HeaderLogo({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderLogoState createState() => _HeaderLogoState();
}

class _HeaderLogoState extends State<HeaderLogo> {
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Center(
      child: Image.asset(
        'assets/logo.png',
        scale:isPortrait==true? 50.sp: 60.sp,
      ),
    );
  }
}
