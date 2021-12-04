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
class ApiCategoryDelete extends GetView<LoginController> {
  static String urlCategory = Urls.urlCategory;

  
  final SingupController city = Get.put(SingupController());
//POST_Category
  getCategoryDelete() async {
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
      if ( prefs.getInt('teste') != null ) {
        for (int i = 0; i <=  prefs.getInt('teste');i++) {
        print(category.fromJson(mapResponse).data.length);
        prefs.remove("id$i");
        prefs.remove("nome$i");
        prefs.remove("imagem$i");
        prefs.remove('teste');   
      }
       
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
