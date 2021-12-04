//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_commerce.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/categoriacity.dart';
import 'package:tnp/core/Data/Models/commerce.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiCategoriaDelete extends GetView<LoginController> {
  static String urlC = Urls.urlBase;
  final SingupController city = Get.put(SingupController());
  final api = ApiCategoria();
//POST_LOGIN
  getCategoriaDelete() async {
    var prefs = await SharedPreferences.getInstance();
     
    
    // ignore: unnecessary_string_interpolations
    final String urlCa = '$urlC';//controller.local
    String cidade =city.cityController.text ==''?controller.local:
       city.cityController.text;
    final String url = urlCa+'/comercios/'+'$cidade';
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
     
       if (prefs.getInt("indexCommerceCa") != null)
     {
       for (int i = prefs.getInt("indexCommerceCa"); i >= 0;) {
           prefs.remove("nomeCommerceCa$i");
           prefs.remove("imgblobCa$i");
           prefs.remove("urlcategoryCa$i");
           prefs.remove("cidadecategoryCa$i");
           prefs.remove("descontoCa$i");
           prefs.remove("codCCa$i");
           prefs.remove("indexCommerceCa");
           print("removeu");
           i--;
           }
     }
     //api.getCategoria();
      
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
