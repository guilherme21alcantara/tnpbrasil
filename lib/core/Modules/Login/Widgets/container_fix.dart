import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Modules/Login/Widgets/Inputs/email.dart';
import 'package:tnp/core/Modules/Login/Widgets/Inputs/password.dart';
import 'package:tnp/core/Modules/Login/Widgets/Links/recovery.dart';
import 'package:tnp/core/Modules/Login/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/Login/Widgets/auth.dart';
import 'package:tnp/core/Modules/Login/Widgets/button.dart';
import 'package:tnp/core/Modules/Login/Widgets/checkbox.dart';

class ContainerFix extends StatefulWidget {
  const ContainerFix({Key? key}) : super(key: key);

  @override
  _ContainerFixState createState() => _ContainerFixState();
}

class _ContainerFixState extends State<ContainerFix> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(
              top: isPortrait == true ? _size.height * 0.3 : _size.height * 0.4,
              left: isPortrait == true ? 20 : _size.width * 0.05),
          child: Container(
            decoration: BoxDecoration(
                color: AppCores.white, borderRadius: BorderRadius.circular(15)),
            height:isPortrait == true ? _size.height * 0.5:_size.height * 1,
            width: _size.width * 0.9,
            child: Stack(
              children: [
                TitleLogin(
                  text: LoginTexts.title,
                  top:isPortrait == true ? _size.height * 0.03: _size.height * 0.05,
                  bottom: 0,
                  left:isPortrait == true ? _size.width * 0.3: _size.width*0.35,
                  right: 0,
                  bold: FontWeight.bold,
                  fonte: 18,
                ),
                TitleLogin(
                  text: LoginTexts.email,
                  top:isPortrait == true ? _size.height * 0.08: _size.height*0.16,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.normal,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                  top: isPortrait == true ?_size.height * 0.11: _size.height*0.22, left: _size.width * 0.05),
                  child: InputEmail(),
                ),
                TitleLogin(
                  text: LoginTexts.password,
                  top:isPortrait == true ? _size.height * 0.185: _size.height*0.38,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.normal,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top:isPortrait == true ? _size.height * 0.22: _size.height*0.45, left: _size.width * 0.05),
                  child: InputPassword(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top:isPortrait == true ? _size.height * 0.3: _size.height*0.55,
                    left: isPortrait == true ?_size.width * 0.02: _size.width*0.05,
                  ),
                  child: Row(
                    children: [
                      CustomCheckbox(
                        texto: LoginTexts.checkboxPassword,
                      ),
                      SizedBox(
                        width:isPortrait==true? _size.width * 0.12: _size.width*0.28,
                      ),
                      
                      LinksRecovery()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:isPortrait == true ? _size.height * 0.35: _size.height*0.72),
                  child: ButtonLogin(),
                ),
                
                
              ],
            ),
          )),
    );
  }
}
