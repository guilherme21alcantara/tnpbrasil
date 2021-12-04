//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/city.dart';
import 'package:tnp/core/Data/Models/estate.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiEstate extends GetView {
  static String urlEstate = Urls.urlEstate;
  
  @override
  final SingupController con = Get.put(SingupController());
//GET_Estate
  getEstate() async {

    var prefs = await SharedPreferences.getInstance();
    // ignore: unnecessary_string_interpolations
    final String url = '$urlEstate';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("GET", Uri.parse(url));
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < 27;) {
        print(27);
        prefs.setInt("id_estate$i", mapResponse[i]["id"]);
        prefs.setString("nomeestado$i", mapResponse[i]["nome"]);
        prefs.setString("uf$i", mapResponse[i]["uf"]);
        prefs.setInt('indexestate', 27);
        i++;
    

      }
          for (var i = 0; i < prefs.getInt("indexestate"); i++) {
      con.list = List.generate(
          prefs.getInt("indexestate"), (i) => prefs.getString("uf$i"));
      i++;
     con.searchList = con.list;
    }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
