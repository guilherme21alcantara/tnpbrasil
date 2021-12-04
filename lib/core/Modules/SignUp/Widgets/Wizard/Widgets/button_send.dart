import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_singup.dart';
import 'package:tnp/core/Modules/Login/Screen/login_screen.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonSend extends GetView<SingupController> {
  @override
  Widget build(BuildContext context) {
    final api_singup = ApiSing();
    Size _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
            left: _size.width * 0.045, top: _size.height * 0.02),
        child: GetBuilder<SingupController>(
            init: SingupController(),
            builder: (_) {
              return Container(
                height: _size.height * 0.09,
                width: _size.width * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppCores.green),
                  ),
                  onPressed: ()async {

                      var prefs = await SharedPreferences.getInstance();
                      if(prefs.getString("cad1") != null)
                      {
                        if (prefs.getString("cad2")!= null)
                        {
                          if (prefs.getString("cad3") != null) {
                            api_singup.postSingUp();
                            Navigator.pop(context);
                             showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Cadastro realizado com sucesso"),
              content: Text("Aproveite o aplicativo TNP "),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () async{
                    Get.to(Login());
                    controller.bairroController.clear();
                    controller.celularController.clear();
                    controller.cepController.clear();
                    controller.city.clear();
                    controller.cityController.clear();
                    controller.cityList.clear();
                    controller.cpfController.clear();
                    prefs.remove("cad3");
                    prefs.remove("cad2");
                    prefs.remove("cad1");
                    
                  },
                )
              ],
            );
          });
                          }
                        }
                      }
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              );
            }));
  }
}
