// @dart=2.9
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class profileController extends GetxController {
  var client = http.Client();
  profileController();
  String name,
      email,
      aniversario,
      rua,
      numero,
      bairro,
      cidade,
      estado,
      cep,
      userImage,
      celular;
  TextEditingController nameController,
      emailController,
      aniversarioController,
      ruaController,
      numeroController,
      bairroController,
      cepController,
      passworController,
      celularController;
  

  @override
  void onInit() async {
    super.onInit();
    var prefs = await SharedPreferences.getInstance();
    name = prefs.getString("namedata");
    email = prefs.getString("emaildata");
    aniversario = prefs.getString("aniversariodata");
    rua = prefs.getString("ruadata");
    numero = prefs.getString("numerodata");
    bairro = prefs.getString("bairrodata");
    cidade = prefs.getString("cidadedata");
    estado = prefs.getString("estadodata");
    cep = prefs.getString("cepdata");
    userImage = prefs.getString("userImagedata");
    celular = prefs.getString("celulardata");

    nameController =TextEditingController();
    emailController = TextEditingController();
    aniversarioController = TextEditingController();
    ruaController = TextEditingController();
    numeroController = TextEditingController();
    bairroController = TextEditingController();
    cepController =TextEditingController();
    passworController = TextEditingController();
    celularController = TextEditingController();
  }
}
