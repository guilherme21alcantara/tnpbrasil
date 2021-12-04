//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_city.dart';
import 'package:tnp/core/Data/Api/api_commerce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Commerce/Screen/commerce_screen.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

void onLoadingCom(BuildContext context) {
  final SingupController controller = Get.put(SingupController());
  final api_commerce = ApiCommerce();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Processando..."),
          content: CupertinoActivityIndicator(
            radius: 13,
          ),
        );
      });
  Future.delayed(Duration(milliseconds: 1500), () async {
    var prefs = await SharedPreferences.getInstance();
    bool ok = prefs.getBool('ok');
    
      print('object');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommerceScreen()),
      );
      //
    
    Navigator.pop(context); //pop dialog
  });
}
