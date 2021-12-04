import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/core/Data/Api/api_city.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

void onLoadingC(BuildContext context) {
  final SingupController controller = Get.put(SingupController());
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("loading..."),
          content: CupertinoActivityIndicator(
            radius: 13,
          ),
        );
      });
   Future.delayed( Duration(seconds: 3), () {
    controller.city;
    print(controller.id);
    print(controller.city);
    Navigator.pop(context); //pop dialog
  });
}