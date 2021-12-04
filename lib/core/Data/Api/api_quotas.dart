//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/quotas.dart';


class ApiQuotas extends GetView {
  final api = Apisaldo();
  static String urlQuotas = Urls.urlQuotas;
//POST_LOGIN
  postQuotas() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlQuotas';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      
    };
    var usuario;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      
      usuario = quotas.fromJson(mapResponse);
      prefs.setString("current", mapResponse["current_supply"]);
      prefs.setInt("quotas", mapResponse["user_quotas"]);
      print(prefs.getString("current"));
      api.postSaldo();
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
