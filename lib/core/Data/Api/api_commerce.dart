//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_commerce_delete.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/commerce.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiCommerce extends GetView<CategoryController> {
  static String urlCommerce = Urls.urlCommerce;
  
  final LoginController contro = Get.put(LoginController());
  final SingupController city = Get.put(SingupController());
//POST_LOGIN
  getCommerce() async {
    var prefs = await SharedPreferences.getInstance();
   // delete.getCommerceDelete();
    // ignore: unnecessary_string_interpolations
    final String url = '$urlCommerce';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['categoria'] = controller.id.toString();
    request.fields['cidade'] = city.cityController.text ==''? contro.local: city.cityController.text;
    request.fields['estado'] = city.stateController.text ==''? contro.uf2: city.stateController.text;
    request.headers.addAll(headers);
    print(controller.id.toString());
    print(contro.local);
    print(contro.uf2);
    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
     print(commerce.fromJson(mapResponse).data.length.toString()+'aaaaaaaaaaa');
    if (response.statusCode == 200) {
     
        for (int i = 0; i <= commerce.fromJson(mapResponse).data.length-1; i++) {
        prefs.setInt("codC$i", mapResponse["data"][i]["cod"]);
        prefs.setString("nomeCommerce$i", mapResponse["data"][i]["nome"]);
        prefs.setString("imgblob$i", mapResponse["data"][i]["imgblob"]);
        prefs.setString('urlcategory$i', mapResponse["data"][i]["uf"]);
        prefs.setString("cidadecategory$i", mapResponse["data"][i]["cidade"]);
        prefs.setString("desconto$i", mapResponse["data"][i]["descontoform"]);
        prefs.setInt('indexCommerce', commerce.fromJson(mapResponse).data.length);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaa')   ;
      }
     prefs.setBool('ok', true);
    }else{
      prefs.setBool('ok', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
