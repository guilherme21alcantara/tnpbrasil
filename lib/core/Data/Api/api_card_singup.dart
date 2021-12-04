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


class ApiCartaoFirst extends GetView <CardController>{
  static String urlCartao = Urls.urlCartao;
  final RegisterPasswordController controllers = Get.put(RegisterPasswordController());
//POST_LOGIN
  postCardFirst() async {
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
    request.fields['expiration_date']=controller.date;
    request.fields['cvv']=controller.cvv;
    request.fields['nome']=controller.name;
    request.fields['senha_numerica']=controllers.pass.text;
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      
      print("deu certo cartao");
      } else {print("erro no cartao");}
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
