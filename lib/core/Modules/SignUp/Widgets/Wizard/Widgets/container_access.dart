import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Button/button_access.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/email.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/estate.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/password_login.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/password_purchase.dart';

class ContainerAccess extends StatefulWidget {
  const ContainerAccess({Key? key}) : super(key: key);

  @override
  _ContainerAccessState createState() => _ContainerAccessState();
}

class _ContainerAccessState extends State<ContainerAccess> {
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
                  text: TEXTS.textemail+text,
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
                  child: InputEmailS(),
                ),
                TitleSing(
                  text: TEXTS.textpassword+text,
                  top: _size.height * 0.24,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.29, left: _size.width * 0.05),
                  child: InputPasswordS(),
                ),
                TitleSing(
                  text: TEXTS.textpassword2+text,
                  top: _size.height * 0.4,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.5,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.45, left: _size.width * 0.05),
                  child: InputPasswordPurchase(),
                ),
                TitleSing(
                  text: TEXTS.textestate+text,
                  top: _size.height * 0.55,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.6, left: _size.width * 0.05),
                  child: InputEstateS(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.69),
                  child: ButtonAccess(),
                )
              ],
            ),
          )),
    );
  }
}
