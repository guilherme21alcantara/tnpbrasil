// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


import 'package:http/http.dart' as http;


class RecoveryController extends GetxController {
  //final teste = ApiBase();
  var client = http.Client();

  RecoveryController();

  var loginProcess = false.obs;
  TextEditingController emailController;
  var email;
  bool test ;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    test = true;

  }

  String validateEmail(String value) {
   /* if (value.length != 6) {
      emailController.text = value;
      teste.postAcesso();
    }
    return null;*/
  }

  String validatePassword(String value) {
    if (value.length != 6) {}
    return null;
  }

  bool obscurePassword()
  {
    test = false;
    update();
  }
}
