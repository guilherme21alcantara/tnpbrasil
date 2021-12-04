import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/Inputs/email.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/Texts/const_text.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/button.dart';

class ContainerFixR extends StatefulWidget {
  const ContainerFixR({Key? key}) : super(key: key);

  @override
  _ContainerFixRState createState() => _ContainerFixRState();
}

class _ContainerFixRState extends State<ContainerFixR> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.3, left: 20),
          child: Container(
            decoration: BoxDecoration(
                color: AppCores.white,
                borderRadius: BorderRadius.circular(15)),
            height: _size.height * 0.42,
            width: _size.width * 0.9,
            child: Stack(
              children: [
                TitleRecovery(
                  text: TEXTR.textitle,
                  top: _size.height * 0.03,
                  bottom: 0,
                  left: _size.width * 0.3,
                  right: 0,
                  bold: FontWeight.bold,
                  fonte: 18,
                ),
                TitleRecovery(
                  text: TEXTR.textinfo,
                  top: _size.height * 0.085,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: 0,
                  bold: FontWeight.normal,
                  fonte: 16,
                ),
                TitleRecovery(
                  text: TEXTR.textemail,
                  top: _size.height * 0.14,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.18, left: _size.width * 0.05),
                  child: InputEmail(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.27),
                  child: ButtonRecovery(),
                )
              ],
            ),
          )),
    );
  }
}
