import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Data/Api/api_update.dart';
import 'package:tnp/core/Modules/Profile/Controller/profile.dart';
import 'package:tnp/core/Modules/Profile/Widgets/bairro.dart';
import 'package:tnp/core/Modules/Profile/Widgets/celular.dart';
import 'package:tnp/core/Modules/Profile/Widgets/cep.dart';
import 'package:tnp/core/Modules/Profile/Widgets/rua.dart';
import 'package:tnp/core/Modules/Profile/Widgets/senha.dart';
import 'package:tnp/core/Modules/Profile/Widgets/text_box_readonly.dart';


class ProfileScreen extends StatefulWidget {
  
   ProfileScreen({Key? key, this.nome, this.email, this.celular, this.bairro, this.rua, this.cep}) : super(key: key);
String ?nome;
  String ?email;
  String ?celular;
  String ?bairro;
  String ?rua;
  String ?cep;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final profileController controller = Get.put(profileController());
    final api_update = ApiurlUpdate();
    return WillPopScope(child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: MainList(conteudo: [
          Padding(
            padding: EdgeInsets.only(right: 125.sp, bottom: 5.sp),
            child: Text(
              ProfileTexts.title,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                inherit: false,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: Container(
              height: 150.sp,
              width: 260.sp,
              decoration: BoxDecoration(
                  color: AppCores.pureWhite,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(30.sp),
                child: CircleAvatar(
                  radius: 40.sp,
                  backgroundImage: NetworkImage(controller.userImage),
                ),
              ),
            ),
          ),
          TextBoxRead(
            title: 'Nome',
            value: controller.name,
          ),
          TextBoxRead(
            title: 'Email',
            value: controller.email,
          ),
          TextBoxTelefone(
            title: 'Fone',
            value: controller.celular,
          ),
        TextBoxEmail(
              title: 'Bairro',
              value: controller.bairro,),
          TextBoxRua(
            title: 'Rua',
            value: controller.rua,
          ),
          TexBoxCep(
            title: 'Cep',
            value: controller.cep,
          ),
          TexBoxSenha(
            title: 'Alterar Senha',
            value: '',
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
            child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(AppCores.mainGreen),
                      maximumSize:
                          MaterialStateProperty.all<Size>(Size(140.sp, 28.sp)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(140.sp, 28.sp)),
                    ),
                    onPressed: () {
                      api_update.posturlUpdate();
                    },
                    child: Center(
                      child: Text(
                        ProfileTexts.addBalance,
                        style: TextStyle(
                            color: AppCores.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ))),
          ),
        ]),
      ),
    ),onWillPop: ()async=> false,);
  }
}
