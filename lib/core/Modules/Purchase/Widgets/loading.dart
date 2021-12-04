// @dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/api_compra.dart';
import 'package:tnp/core/Data/Api/api_extract_del.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Transactions/Screen/successful_transaction_tnp.dart';

onLoadingComercio(BuildContext context) {
  final apicomercio = ApiCompra();
  final PurchaseController purchase = Get.put(PurchaseController());
 final del =ApiExtractDel();
 
  
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
  apicomercio.postCompra();
  
 
  
  Future.delayed(Duration(seconds: 2), () async {
    var prefs = await SharedPreferences.getInstance();
    //Get.toNamed(Routes.pix);
    bool com = prefs.getBool('ac');
    // ignore: prefer_conditional_assignment
    print(com);
    if (com = true)
    {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: ()async => false,
              child: AlertDialog(
              title: Text("Compra realizada"),
              content: Text("sua compra foi realizada com sucesso!"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () { 
                     del.postExtratoDel();
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessfulTransactionsScreenTnp()),
                            );
                 //   Get.toNamed(Routes.successfulTransactionTnp);
                  },
                )
              ],
            ),);
          });
    }else
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
     //ssprefs.remove("saldo");
    
     
  });
}
