// @dart=2.9
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/api_quotas.dart';

class CardController extends GetxController {
 
  var client = http.Client();
  String number, date ,cvv, name;
  TextEditingController valor;
  CardController();
  bool recorrencia, validoR, validoNR;
  @override
  void onInit() async {
    super.onInit();
    number = '';
    date = '';
    cvv = '';
    name = '';
    valor = TextEditingController();
    recorrencia;
    validoR;
    validoNR;
  }

  

}
