//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_category_delete.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/category.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
//categoria dos icones
class ApiCategory extends GetView<LoginController> {
  static String urlCategory = Urls.urlCategory;

  
  final SingupController city = Get.put(SingupController());
//POST_Category
  getCategory() async {
    //delete.getCategoryDelete();
    var prefs = await SharedPreferences.getInstance();
    // ignore: unnecessary_string_interpolations
     
    final String url = '$urlCategory';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields['cidade'] = city.cityController.text ==''? controller.local: city.cityController.text;
    request.fields['estado'] = city.stateController.text ==''? controller.uf2: city.stateController.text;
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    print(category.fromJson(mapResponse).data.length);
    if (response.statusCode == 200) {
    
      for (int i = 0; i <= category.fromJson(mapResponse).data.length-1;i++) {
        print(category.fromJson(mapResponse).data.length); 
        prefs.setInt("id$i", mapResponse["data"][i]["id"]);
        prefs.setString("nome$i", mapResponse["data"][i]["nome"]);
        prefs.setString("imagem$i", mapResponse["data"][i]["imagem"]);
        prefs.setInt('teste', category.fromJson(mapResponse).data.length);
        prefs.setBool('Certo', true);
      }
    }else
    {
      prefs.setBool('Certo', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
