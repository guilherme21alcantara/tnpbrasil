import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Button/button_personal.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/cpf.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/data.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/name.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/telefone.dart';

class ContainerPersonal extends StatefulWidget {
  const ContainerPersonal({Key? key}) : super(key: key);

  @override
  _ContainerPersonalState createState() => _ContainerPersonalState();
}

class _ContainerPersonalState extends State<ContainerPersonal> {
  @override
  Widget build(BuildContext context) {
    String text = '*' ;
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.3, left: 20),
          child: Container(
            decoration: BoxDecoration(
                color: AppCores.white,
                borderRadius: BorderRadius.circular(15)),
            height: _size.height * 0.82,
            width: _size.width * 0.9,
            child: Stack(
              children: [
                TitleSing(
                  text: TEXTS.textitle,
                  top: _size.height * 0.03,
                  bottom: 0,
                  left: _size.width * 0.3,
                  right: 0,
                  bold: FontWeight.bold,
                  fonte: 18,
                ),
                TitleSing(
                  text: TEXTS.textname+text,
                  top: _size.height * 0.1,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.14, left: _size.width * 0.05),
                  child: InputNamelS(),
                ),
                TitleSing(
                  text: TEXTS.textcpf+text,
                  top: _size.height * 0.24,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.28, left: _size.width * 0.05),
                  child: InputCpfS(),
                ),
                TitleSing(
                  text: TEXTS.textnasc+text,
                  top: _size.height * 0.38,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.45, left: _size.width * 0.05),
                  child: InputDataS(),
                ),
                TitleSing(
                  text: TEXTS.texttelefone+text,
                  top: _size.height * 0.55,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.59, left: _size.width * 0.05),
                  child: InputTeleS(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.69),
                  child: ButtonPersonal(),
                )
              ],
            ),
          )),
    );
  }
}
