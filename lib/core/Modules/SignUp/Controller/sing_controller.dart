// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class SingupController extends GetxController {
  //final teste = ApiBase();
  var client = http.Client();

  SingupController();
  List city;
  List cityList = [];
  List idState;
  List searchId = [];
  List list;
  List searchList = [];
  int id, idCity;
  bool read;
  TextEditingController 
      emailController,
      passwordController,
      nameController,
      cpfController,
      celularController,
      dataController,
      stateController,
      cityController,
      bairroController,
      numController,
      ruaController,
      cepController,
      passController,
      paiController;
  bool validaPD, validaAdd, validaAcc, obscure;

  @override
  void onInit() async {
    super.onInit();

    var prefs = await SharedPreferences.getInstance();
    
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cpfController = TextEditingController();
    celularController = TextEditingController();
    dataController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    bairroController = TextEditingController();
    ruaController = TextEditingController();
    numController = TextEditingController();
    cepController = TextEditingController();
    passController = TextEditingController();
    validaPD = false;
    validaAcc = false;
    validaAdd = false;
    cityGet();
  }

  void cityGet() async {
    var prefs = await SharedPreferences.getInstance();
    for (var i = 0; i < prefs.getInt("indexcity"); i++) {
      city = List.generate(
          prefs.getInt("indexcity"), (i) => prefs.getString("cli_cidade$i"));
      i++;
      cityList = city;
    }
  }

  validator()
  {
    if (passController == passwordController)
    {
      print("object");
    }
  }
}
