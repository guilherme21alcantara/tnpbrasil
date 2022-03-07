// @dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/ap_getdata.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';

onLoadingH(BuildContext context) {
  final api_category = ApiCategory();
  final api_getdata = Apigetdata();
  final quotas = ApiQuotas();
  final api = Apisaldo();
  final api_extract = ApiExtract();
  final PurchaseController controller = Get.put(PurchaseController());

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

  api_extract.postExtrato();
  api_getdata.postgetdata();
  api.postSaldo();

  sleep(Duration(milliseconds: 200));
  api_category.getCategory();
  sleep(Duration(milliseconds: 200));
  controller.saldo;
  Future.delayed(Duration(seconds: 2), () async {
    var prefs = await SharedPreferences.getInstance();
    bool acesso = (prefs.getBool("acesso"));
    if (acesso == true) {
      Get.toNamed(Routes.home);
      quotas.postQuotas();
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Erro login"),
              content: Text("Email ou senha invalidos caralho"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  });
}
