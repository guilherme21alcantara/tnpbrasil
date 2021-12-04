import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/title.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Button/button_address.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/bairro.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/cep.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/city.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/number.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/street.dart';

class ContainerAddress extends StatefulWidget {
  const ContainerAddress({Key? key}) : super(key: key);

  @override
  _ContainerAddressState createState() => _ContainerAddressState();
}

class _ContainerAddressState extends State<ContainerAddress> {
  @override
  Widget build(BuildContext context) {
    final SingupController controller = Get.put(SingupController());
   controller.cityGet();
    String text = '*';
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.3, left: 20),
          child: Container(
            decoration: BoxDecoration(
                color: AppCores.white, borderRadius: BorderRadius.circular(15)),
            height: _size.height * 1,
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
                  text: TEXTS.textcity + text,
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
                  child: InputCityS(controller: controller.city,),
                ),
                TitleSing(
                  text: TEXTS.textbairro + text,
                  top: _size.height * 0.25,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.3, left: _size.width * 0.05),
                  child: InputBairroS(),
                ),
                TitleSing(
                  text: TEXTS.textstreet + text,
                  top: _size.height * 0.39,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.43, left: _size.width * 0.05),
                  child: InputRuaS(),
                ),
                TitleSing(
                  text: TEXTS.textnumber + text,
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
                  child: InputNumS(),
                ),
                TitleSing(
                  text: TEXTS.textcep + text,
                  top: _size.height * 0.7,
                  bottom: 0,
                  left: _size.width * 0.05,
                  right: _size.width * 0.6,
                  bold: FontWeight.bold,
                  fonte: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _size.height * 0.75, left: _size.width * 0.05),
                  child: InputCepS(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.88),
                  child: ButtonAddress(),
                )
              ],
            ),
          )),
    );
  }
}
