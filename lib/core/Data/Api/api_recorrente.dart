//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';


class ApiCartaoRecorrente extends GetView <CardController>{
  static String urlRecorrente = Urls.urlRecorrente;
  final RegisterPasswordController controllers =
        Get.put(RegisterPasswordController());
  final CategoryController contro = Get.put(CategoryController());
//POST_LOGIN
  postCartaoR() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlRecorrente';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.fields['valor']= controller.valor.text.replaceAll(',', '.');
    request.fields['senha_numerica']= controllers.pass.text;
    request.headers.addAll(headers);

    
    
    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      prefs.setBool("ValidoR", true);
      controller.validoR = prefs.getBool('ValidoR');
      prefs.reload();
      
      
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
