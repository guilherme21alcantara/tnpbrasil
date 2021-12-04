//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/categoriacity.dart';
import 'package:tnp/core/Data/Models/commerce.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiCategoria extends GetView<LoginController> {
  static String urlC = Urls.urlBase;
  final SingupController city = Get.put(SingupController());
//categoria dos cards depois que clica nos icones
  getCategoria() async {
    
    var prefs = await SharedPreferences.getInstance();
  
     //api.getCategoria();
    // api.getCategory();
      
    
    // ignore: unnecessary_string_interpolations
    final String urlCa = '$urlC';//controller.local
    String cidade =city.cityController.text ==''?controller.local:
       city.cityController.text;
    final String url = urlCa+'/comercios/'+cidade;
    print(url);
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("GET", Uri.parse(url));
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    print(response.statusCode);     
    if (response.statusCode == 200) {
      print(cidade);
     
      for (int i = 0; i < categoriacity.fromJson(mapResponse).data.length;) {
        prefs.setInt("codCa$i", mapResponse["data"][i]["cod"]);
        prefs.setString("nomeCommerceCa$i", mapResponse["data"][i]["nome"]);
        prefs.setString("imgblobCa$i", mapResponse["data"][i]["imgblob"]);
        prefs.setString("cidadecategoryCa$i", mapResponse["data"][i]["cidade"]);
        prefs.setString('urlcategoryCa$i', mapResponse["data"][i]["uf"]);
        prefs.setString("descontoCa$i", mapResponse["data"][i]["descontoform"]);
        prefs.setInt('indexCommerceCa', commerce.fromJson(mapResponse).data.length);
        print('aqui man');
        i++;
      }
      prefs.setBool('ok', true);
    }else
    {
      prefs.setBool('ok', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
