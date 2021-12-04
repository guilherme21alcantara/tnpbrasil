//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';


class ApiCartao extends GetView <CardController>{
  static String urlCartao = Urls.urlCartaoFirst;
  final RegisterPasswordController controllers = Get.put(RegisterPasswordController());
  
//POST_LOGIN
  postCartao() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlCartao';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.fields['number']= controller.number;
    request.fields['expiration_date']=controller.date.replaceAll('/', '');
    request.fields['cvv']=controller.cvv.toString();
    request.fields['valor']=controller.valor.text.replaceAll(',', '.');
    request.fields['nome']=controller.name;
    request.fields['senha_numerica']=controllers.pass.text;
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
        print(response.statusCode);
        print(response.statusCode);
    if (response.statusCode == 200) {
        prefs.setBool("ValidoNR", true);
        controller.validoNR = prefs.getBool('ValidoNR');
      print("aaaaalllllllllllllllllllllllllllllll");
      } else{print(response.statusCode.toString());}
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
