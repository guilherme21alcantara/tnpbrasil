import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/Category/Widgets/gridview.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final api = Apisaldo();
  final apicat = ApiCategory();
  
  @override
  void initState() {
    super.initState();
    api.postSaldo();
    apicat.getCategory();
  }

  
  Widget build(BuildContext context) {
  
    return WillPopScope(
      onWillPop: ()async=> false,
      child: Scaffold(
      body: Stack(
        children:  [
          SearchList(),
        ],
      ),
    ),);
  }
}
