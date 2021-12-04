//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/Recovery/Controller/recovery_controller.dart';


class ApiRecovery extends GetView {
  @override
  final RecoveryController controller = Get.put(RecoveryController());
  static String urlRecovery = Urls.urlRecovery;
//POST_LOGIN
  postRecovery() async {
    //login.postAcesso();
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlRecovery';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['email'] = controller.emailController.text;
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
