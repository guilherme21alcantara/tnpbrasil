//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/autenticar.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';

class ApiLogin extends GetView<LoginController> {
  static String urlToken = Urls.urlLogin;
  final api = ApiQuotas();

//POST_LOGIN
  postAcesso() async {
    // ignore: unnecessary_string_interpolations
    final String url = '$urlToken';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    print(controller.emailc.text + 'a');
    var usuario;
    var prefs = await SharedPreferences.getInstance();
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['login'] = controller.emailController.text == ''
        ? controller.emailc.text == ''
            ? controller.e.text
            : controller.emailc.text
        : controller.emailController.text;
    request.fields['password'] = controller.passwordController.text == ''
        ? controller.passc.text == ''
            ? controller.p.text
            : controller.passc.text
        : controller.passwordController.text;
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    var mapResponse = json.decode(response.body);
    prefs.setBool('acesso', true);
    if (response.statusCode == 200) {
      usuario = autenticar.fromJson(mapResponse);

      prefs.setString("token", mapResponse["token"]);
      prefs.setInt("expires_in", mapResponse["expires_in"]);
      prefs.setInt("user_id", mapResponse["user_id"]);
      prefs.setBool("pass", mapResponse["senha_numerica"]);
      api.postQuotas();
    } else {
      prefs.setBool('acesso', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
