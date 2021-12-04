import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/Global/scaffold.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/api_extract_del.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Modules/Category/Screen/category.dart';
import 'package:tnp/core/Modules/Category/saldo.dart';
import 'package:tnp/core/Modules/Commerce/Screen/commerce_screen.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/list_city.dart';
import 'package:tnp/core/Modules/Extract/Screen/extract_screen.dart';
import 'package:tnp/core/Modules/Profile/Controller/profile.dart';
import 'package:tnp/core/Modules/Profile/Screen/profile_screen.dart';
import 'package:tnp/core/Modules/Quotas/Controller/quotas_controller.dart';
import 'package:tnp/core/Modules/Quotas/Screen/quotas_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ext = ApiExtract();
  final quotas = ApiQuotas();
  final api_commerce = ApiCategoria();
  final cat = ApiCategory();
  
  
  @override
   void initState() {
    super.initState();
    
    
      ext.postExtrato();
      quotas.postQuotas();
      api_commerce.getCategoria();
      cat.getCategory();
      
      }
  @override
  Widget build(BuildContext context) {
    final profileController contro = Get.put(profileController());
    final QuotasController controller = Get.put(QuotasController());
    sleep(Duration(seconds: 2));
    return WillPopScope(
      
      child: ScaffoldHome(
      conteudo: [
        Category(),
        SearchCommerceCity(),
        ExtractScreen(),
        Quotas(
          valor: controller.current,
          quotas: controller.user_quotas,
        ),
        ProfileScreen(
          nome: contro.name,
          email: contro.email,
          celular: contro.celular,
          bairro: contro.bairro,
          rua: contro.rua,
          cep: contro.cep,
        ),
      ],
    ),onWillPop: ()async=> false,);
  }
}
