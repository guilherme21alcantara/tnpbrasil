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
import 'package:tnp/core/Data/Api/api_login.dart';
import 'package:tnp/core/Data/Api/api_pix.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Modules/Category/Widgets/loading.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/PIX/Controller/pix_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

onLoadingPix(BuildContext context) {
  final apipix = ApiPix();
  final PixController pix = Get.put(PixController());

  
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
  apipix.postPix();
  Future.delayed(Duration(seconds: 2), () async {
    
    final PixController contro = Get.put(PixController());
    final CardController controller = Get.put(CardController());
    final RegisterPasswordController con = Get.put(RegisterPasswordController());
    final PixController pix = Get.put(PixController());
    var prefs = await SharedPreferences.getInstance();
    pix.chave = prefs.getString("chave");
    bool acpix = prefs.get('acpix');
    if (acpix) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Chave pix gerada"),
              content: Text("sua chave Pix foi gerada com sucesso!"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    pix.chave = prefs.getString("chave");
                    sleep(Duration(milliseconds: 20));
                    Get.toNamed(Routes.pix);                
                   // controller.valor.clear();
                   // con.pass.clear();
                  },
                )
              ],
            );
          });  
    }
    else
    {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: ()async => false,
              child: AlertDialog(
              title: Text("Erro na senha"),
              content: Text("Por favor verifique a senha digitada! "),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () { 
                     Navigator.pop(context);
                     Navigator.pop(context);
                 //   Get.toNamed(Routes.successfulTransactionTnp);
                  },
                )
              ],
            ),);
          });
    }
     
  });
}
