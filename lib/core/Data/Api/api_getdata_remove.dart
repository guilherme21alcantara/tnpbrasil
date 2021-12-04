//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/getdata.dart';


class ApigetdataDelete extends GetView {
  static String urlgetdata = Urls.urlgetdata;
  
//POST_LOGIN
  postgetdatadelete() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlgetdata';
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
      
        prefs.remove('namedata');
        prefs.remove('emaildata');
        prefs.remove('aniversariodata');
        prefs.remove('ruadata');
        prefs.remove('numerodata');
        prefs.remove('bairrodata');
        prefs.remove('cepdata');
        prefs.remove('userImagedata');
        prefs.remove('celulardata');
        prefs.remove('recorrenciadata');
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
