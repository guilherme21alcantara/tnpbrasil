// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CategoryController extends GetxController {
 
  CategoryController();

  TextEditingController searchController;
  bool test ;
  String input;
  int id;
  String name_category;
  String image;
  String saldo, nome, cpf, email;
  int index;
  @override
  void onInit() async{
    super.onInit();
      var prefs = await SharedPreferences.getInstance();
     saldo = prefs.getString("saldo");
     nome = prefs.getString("nomesaldo");
     cpf = prefs.getString("cpfsaldo");
     email = prefs.getString("emailsaldo");
    searchController = TextEditingController();
    test = true;

  }
}
