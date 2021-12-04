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


class Apigetdata extends GetView {
  static String urlgetdata = Urls.urlgetdata;
  
//POST_LOGIN
  postgetdata() async {
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
      
      print(prefs.getInt("user_id").toString());
      usuario = getdata.fromJson(mapResponse);
      prefs.setString("namedata", mapResponse["data"]["name"]);
      prefs.setString("emaildata", mapResponse["data"]["email"]);
      prefs.setString("aniversariodata", mapResponse["data"]["aniversario"]);
      prefs.setString("ruadata", mapResponse["data"]["rua"]);
      prefs.setString("numerodata", mapResponse["data"]["numero"]);
      prefs.setString("bairrodata", mapResponse["data"]["bairro"]);
      prefs.setString("cepdata", mapResponse["data"]["cep"]);
      prefs.setString("userImagedata", mapResponse["data"]["userImage"]);
      prefs.setString("celulardata", mapResponse["data"]["celular"]);
      prefs.setBool("recorrenciadata", mapResponse["data"]["recorrencia_cartao"]);
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
