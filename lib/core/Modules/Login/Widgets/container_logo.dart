import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Login/Widgets/custom_clipper.dart';

class ContainerLogo extends StatelessWidget {
  const ContainerLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        ClipPath(
          clipper: NativeClipper(),
          child: Container(
              height: isPortrait==true? _size.height / 1.7:_size.height / 1.7 ,
              width: isPortrait==true? _size.width:_size.width,
              color: AppCores.darkbluecyan,
              child: Padding(
                padding: EdgeInsets.only(bottom: _size.height * 0.22),
                child: Image.asset(
                  'assets/logo.png',
                  scale: _size.height / 25,
                ),
              )),
        ),
      ],
    );
  }
}
