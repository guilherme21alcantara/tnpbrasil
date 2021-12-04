//@dart=2.9
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Data/Models/compra.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';



class ApiCompra extends GetView <PurchaseController>{
  static String urlCompra = Urls.urlCompra;
  final CategoryController control = Get.put(CategoryController());
  final apipurchase = Apisaldo();
  
//POST_LOGIN
  postCompra() async {
    //login.postAcesso();
    var usuario;
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    // ignore: unnecessary_string_interpolations
    final String url = '$urlCompra';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Authorization':  'Bearer $token',
    };
    print(prefs.getInt("user_id").toString());
    print(controller.cod.toString());
    print(controller.compra.text.replaceAll(',', '.'));
    print(controller.password.text);
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['usuario'] = prefs.getInt("user_id").toString();
    request.fields['comercio']= controller.cod.toString();
    request.fields['valor']= controller.compra.text.replaceAll(',', '.');
    request.fields['senha_numerica']= controller.password.text;
    
    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
     var mapResponse = json.decode(response.body);
     print(response.statusCode+1);
    if (response.statusCode == 200) {
      usuario = compra.fromJson(mapResponse);
      print("deu certoa");
      controller.date = prefs.getInt('dataC');

      apipurchase.postSaldo();
      prefs.setString('cnp',mapResponse['cnpj']);
      controller.cnpj = prefs.getString('cnp');
      prefs.setBool('ac', true);
      print('ccccccccccccccccccccccccccccccc');
      } else {
        print(prefs.getString("nao foi "));prefs.setBool('ac', false);}
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
