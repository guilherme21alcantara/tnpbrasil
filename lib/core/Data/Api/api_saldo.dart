//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/ap_getdata.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/saldo.dart';


class Apisaldo extends GetView {
  
  static String urlsaldo = Urls.urlsaldo;
//POST_SALDO
  postSaldo() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlsaldo';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    var usuario;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    
    if (response.statusCode == 200) {
      print(prefs.getString('saldo'));
      usuario = saldo.fromJson(mapResponse);
      //cli_cpf
      prefs.setString("saldo", mapResponse["data"]["cli_saldoform"]);
      prefs.setString("cpfsaldo", mapResponse["data"]["cli_cpf"]);
      prefs.setString("nomesaldo", mapResponse["data"]["cli_nome"]);
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
