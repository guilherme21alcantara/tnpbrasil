//@dart=2.9
// ignore: implementation_imports
import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/city.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiCity extends GetView <SingupController> {
  static String urlCity = Urls.urlCity;
  
//GET_CITY
  getCity() async {
    var prefs = await SharedPreferences.getInstance();
    // ignore: unnecessary_string_interpolations
    int id = controller.id;
    final String url = '$urlCity$id';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("GET", Uri.parse(url));
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    List mapResponse = json.decode(response.body);
    var map = json.decode(response.body);
    if (response.statusCode == 200) {
      print(mapResponse.length);
      if( mapResponse.length != null && prefs.getInt("indexcity") !=null)
        {
          
          for (int i = prefs.getInt("indexcity"); i >= 0;) {
          print("ooooooooo");
          prefs.remove("cliId$i");
          prefs.remove("cli_cidade$i");
          prefs.remove("cli_estado$i");
          print("removeu");
          i--;
          }
        }
        
      for (int i = 0; i < mapResponse.length;) {
        print("oooooooooaaaaaaaaaaa");
        prefs.setInt("cliId$i", map[i]["id"]);
        print(prefs.getInt("cliId2"));
        prefs.setString("cli_cidade$i", map[i]["nome"]);
        prefs.setInt("cli_estado$i", map[i]["estado"]);
        prefs.setInt('indexcity', mapResponse.length);
        i++;
      }
      sleep(Duration(milliseconds: 200));
      controller.cityGet();
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
