//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_login.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/extract.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';

class ApiExtract extends GetView<LoginController> {
  static String urlExtract = Urls.urlExtract;
  final login = ApiLogin();
//POST_LOGIN
  postExtrato() async {
    login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlExtract';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var usuario;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {

      for (int i = 0; i < extract.fromJson(mapResponse).data.length;) {
      usuario = extract.fromJson(mapResponse);
      prefs.setInt("indexextract", extract.fromJson(mapResponse).data.length);
      prefs.setString("date$i", mapResponse["data"][i]["data"]);
      prefs.setString("valor$i", mapResponse["data"][i]["valor"]);
      prefs.setString("historico$i", mapResponse["data"][i]["historico"]);
      prefs.setString("operacao$i", mapResponse["data"][i]["operacao"]);
      prefs.setInt("cod$i", mapResponse["data"][i]["cod"]);
      i++;
     
      }
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
