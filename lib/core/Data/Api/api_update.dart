//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Modules/Profile/Controller/profile.dart';
import 'package:tnp/core/Modules/Profile/Screen/profile_screen.dart';


class ApiurlUpdate extends GetView<profileController> {
  static String urlurlUpdate = Urls.urlUpdate;
  
  
//POST_Update
  posturlUpdate() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlurlUpdate';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    var usuario;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario']=prefs.getInt("user_id").toString();
    request.fields['celular'] = controller.celularController.text?? controller.celular;
    request.fields['bairro'] = controller.bairroController.text ?? controller.bairro;
    request.fields['rua'] = controller.ruaController.text ?? controller.rua;
    request.fields['numero']= controller.numeroController.text ?? controller.numero;
    request.fields['cep'] = controller.cepController.text ?? controller.cep;
    request.fields['senha'] = controller.passworController.text ?? " ";
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      print(prefs.getInt("user_id").toString());
      } 
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
