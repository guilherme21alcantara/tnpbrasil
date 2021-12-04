//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/pix.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/PIX/Controller/pix_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';


class ApiPix extends GetView <CardController>{
  static String urlPix = Urls.urlPix;
  final PixController contro = Get.put(PixController());
//POST_LOGIN
  postPix() async {
    //login.postAcesso();

    final RegisterPasswordController controllers =
        Get.put(RegisterPasswordController());
    var usuario;
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlPix';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] =prefs.getInt("user_id").toString();
    request.fields['valor']= controller.valor.text.replaceAll(',', '.');
    request.fields['senha_numerica']= controllers.pix.text;
    
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
     var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      usuario = pix.fromJson(mapResponse);
      prefs.setString("chave", mapResponse["chave"]);
      print(prefs.getString("chave"));
      //contro.chave = prefs.getString("chave");
        prefs.setBool('acpix', true);
      } else {print(prefs.getString("nao deu"));prefs.setBool('acpix', false);}
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
