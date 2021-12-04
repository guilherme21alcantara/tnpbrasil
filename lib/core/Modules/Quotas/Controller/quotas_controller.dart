// @dart=2.9
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/api_quotas.dart';

class QuotasController extends GetxController {
  final api = ApiQuotas();
  var client = http.Client();
  // ignore: non_constant_identifier_names
  String current,user_quotas;
  QuotasController();
 
  @override
  void onInit() async {
    super.onInit();
    api.postQuotas();
  var prefs = await SharedPreferences.getInstance();
     current = prefs.getString("current");
     user_quotas = prefs.getInt("quotas").toString();
    
     
  }

  

}
