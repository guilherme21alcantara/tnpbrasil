import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_categoria_delete.dart';
import 'package:tnp/core/Data/Api/api_estate.dart';
import 'package:tnp/core/Data/Models/db_biometria.dart';
import 'package:tnp/core/Data/Models/db_salva.dart';
import 'package:tnp/core/Data/db_table.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final LoginController controller = Get.put(LoginController());
  final CardController card = Get.put(CardController());
  final dbhelper = DatabaseHelper.instance;
  final apidelete = ApiCategoriaDelete();
  final api_estate = ApiEstate();
  @override
  void initState() {
    super.initState();
    api_estate.getEstate();
    apidelete.getCategoriaDelete();
    Timer(const Duration(seconds: 4), () async {
     
      controller.getUserLocation();
      final dbHelper = DatabaseHelper.instance.database;
      final db = await dbHelper;
      var res = await db.rawQuery("SELECT * FROM login");
      final dbHelperbio = DatabaseHelperBio.instance.database;
      final bio = await dbHelperbio;
      var resbio = await bio.rawQuery("SELECT * FROM bio");

      final dbHelpersave = DatabaseHelperSave.instance.database;
      final save = await dbHelpersave;
      var ressave = await save.rawQuery("SELECT * FROM save");
      
      if (resbio.isNotEmpty && res.isNotEmpty && ressave.isNotEmpty) {
        //card.recorrencia = true;
        
        controller.sav = true;
        controller.emailController.text =
            res.first.values.skip(1).take(1).single.toString();
        controller.passwordController.text =
            res.first.values.skip(2).take(1).single.toString();
        print(res.first.values);
      }
      if (res.isNotEmpty && ressave.isNotEmpty && resbio.isEmpty) {
       // card.recorrencia = true;
        controller.sav = true;
        controller.emailController.text =
            res.first.values.skip(1).take(1).single.toString();
        controller.passwordController.text =
            res.first.values.skip(2).take(1).single.toString();
            
        
      }
      if (res.isNotEmpty && ressave.isEmpty && resbio.isNotEmpty) {
       // card.recorrencia = true;
        controller.sav = false;
        controller.e.text =
            res.first.values.skip(1).take(1).single.toString();
        controller.p.text =
            res.first.values.skip(2).take(1).single.toString();
      }

      if (resbio.isEmpty&& ressave.isEmpty)
      {
        controller.sav = false;  
      }

       Get.toNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppCores.darkbluecyan,
          image:
              DecorationImage(image: AssetImage("assets/logo.png"), scale: 30)),
    );
  }
}
