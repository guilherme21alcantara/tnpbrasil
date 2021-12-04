// @dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/ap_getdata.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_category_delete.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/api_getdata_remove.dart';
import 'package:tnp/core/Data/Api/api_login.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/db_table.dart';
import 'package:tnp/core/Modules/Category/Widgets/loading.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

onLoading(BuildContext context) {
  final LoginController controller = Get.put(LoginController());
  final CardController card = Get.put(CardController());
  final api = ApiLogin();
  final api_quotas = ApiQuotas();
  final deletes = ApigetdataDelete();
  final api_extract = ApiExtract();
  final api_getdata = Apigetdata();
  final quotas = ApiQuotas();
  final api_saldo = Apisaldo();
  final apicat = ApiCategoryDelete();
  final dbhelper = DatabaseHelper.instance;
  
    
  String urlToken = Urls.urlLogin;
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
  api.postAcesso();
  controller.getUserLocation();
  sleep(Duration(milliseconds: 200));
  apicat.getCategoryDelete();
  sleep(Duration(milliseconds: 200));
  deletes.postgetdatadelete();
  sleep(Duration(milliseconds: 200));
  Future.delayed(Duration(seconds: 4), () async {
    api_getdata.postgetdata();
    var prefs = await SharedPreferences.getInstance();
    bool acesso = (prefs.getBool("acesso"));
    bool senha = (prefs.getBool("pass"));
    if (acesso == true) {
     
      api_saldo.postSaldo();
      if (senha) {
        onLoadingH(context);
       // Get.toNamed(Routes.home);
        
      } else {
        Get.toNamed(Routes.registerFourPasSing);
        print(senha);
        
      }
    } else {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Erro login"),
              content: Text("Email ou senha invalidos"),
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
