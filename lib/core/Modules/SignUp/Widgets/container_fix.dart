import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Card/access.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Card/adresse.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Card/personal_data.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/button_send.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/checkbox.dart';

class ContainerSignUp extends StatefulWidget {
  const ContainerSignUp({Key? key}) : super(key: key);

  @override
  _ContainerSignUpRState createState() => _ContainerSignUpRState();
}

class _ContainerSignUpRState extends State<ContainerSignUp> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.3, left: 20),
          child: Container(
            decoration: BoxDecoration(
                color: AppCores.white, borderRadius: BorderRadius.circular(15)),
            height: _size.height * 0.54,
            width: _size.width * 0.9,
            child: Stack(
              children: [
                TitleRecovery(
                  text: TEXTS.textitle,
                  top: _size.height * 0.03,
                  bottom: 0,
                  left: _size.width * 0.3,
                  right: 0,
                  bold: FontWeight.bold,
                  fonte: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.1, right: _size.width * 0.05),
                  child: DadosPessoais(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.2, right: _size.width * 0.05),
                  child: Access(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.3, right: _size.width * 0.05),
                  child: Adresses(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.37, left: _size.width * 0.05),
                  child: CustomCheckboxTerm(texto: "Estou de acordo com os termos de uso",),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.41),
                  child: ButtonSend(),
                ),
              //  CustomCheckboxTerm
              ],
            ),
          )),
    );
  }
}
