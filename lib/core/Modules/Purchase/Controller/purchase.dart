// @dart=2.9
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/api_quotas.dart';

class PurchaseController extends GetxController {
 
  var client = http.Client();
  String saldo, nome, cpf, email;
  PurchaseController();
  String title, subtitle, image,urlcategory,desconto, cidadecategory;
  int cod;
  TextEditingController compra;
  TextEditingController password;
  int date;
  String cnpj;
  @override
  void onInit() async {
    super.onInit();
    compra = TextEditingController();
    password = TextEditingController();
     var prefs = await SharedPreferences.getInstance();
     saldo = prefs.getString("saldo");
     nome = prefs.getString("nomesaldo");
     cpf = prefs.getString("cpfsaldo");
     email = prefs.getString("emailsaldo");
     cnpj ;
     cod;
     date;
     
  }
}
