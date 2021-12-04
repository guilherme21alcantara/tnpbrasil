// @dart=2.9
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Modules/Category/Widgets/loading.dart';
import 'package:tnp/core/Modules/Home/screen.dart';



onLoadingCat(BuildContext context) {  
  String urlToken = Urls.urlLogin;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("loading..."),
          content: CupertinoActivityIndicator(
            radius: 13,
          ),
        );
      });
  
  Future.delayed(Duration(seconds: 4), () async {
    
    Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Home()),
                                            );
    
  });
}
