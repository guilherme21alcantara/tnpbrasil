// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/api_extract_del.dart';
import 'package:tnp/core/Data/Api/api_recorrente.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

onLoadingRecorrente(BuildContext context) {
 final apicard = ApiCartaoRecorrente();

  final PurchaseController controller = Get.put(PurchaseController());
  final CardController contro = Get.put(CardController());
  
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

  //apicard.postCartaoR();
  
  Future.delayed(Duration(seconds: 2), () async {
    var prefs = await SharedPreferences.getInstance();
    bool acesso = (prefs.getBool("Valido"));
    
    if (contro.validoR == true) {
      Get.toNamed(Routes.successfulTransaction);
      
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Falha na transação"),
              content: Text("Houve erro no processamento da transação. Tente novamente!"),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Get.toNamed(Routes.home);
                  },
                )
              ],
            );
          });
    }
  });
}
