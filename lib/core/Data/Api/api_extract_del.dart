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

class ApiExtractDel extends GetView<LoginController> {
  static String urlExtract = Urls.urlExtract;
  final login = ApiLogin();
//POST_LOGIN
  postExtratoDel() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlExtract';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      print(prefs.getInt('indexextract'));
      for (int i = 0; i <= prefs.getInt('indexextract')-1;i++) {
      prefs.remove("date$i");
      prefs.remove("valor$i");
      prefs.remove("historico$i");
      prefs.remove("operacao$i");
      prefs.remove("cod$i");
      }
      prefs.remove('indexextract');
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
