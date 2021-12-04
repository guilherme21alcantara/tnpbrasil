import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonAccess extends GetView<SingupController> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async{
                     var prefs = await SharedPreferences.getInstance();
                    if (controller.emailController.text != ''&& controller.passController.text != '' && controller.passwordController.text !='')
                    {
                      if (controller.passController.text == controller.passwordController.text&& prefs.getString("cad1") != null) {
                         var prefs = await SharedPreferences.getInstance();
                        prefs.setString("cad2", 'ok');
                        Navigator.pop(context, true);
                      }

                    }
                    else
                    {
                      Navigator.pop(context, false);
                    }
                    // onLoading(context);
                    // controller.checkLogin();
                    
                  },
                  child: Text(
                    'Continuar',
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
