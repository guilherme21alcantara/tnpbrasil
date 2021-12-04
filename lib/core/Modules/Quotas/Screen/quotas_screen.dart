import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Data/Api/api_quotas.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/Quotas/Controller/quotas_controller.dart';
import 'package:tnp/core/Modules/Quotas/Widgets/card_quotas.dart';
import 'package:tnp/core/Modules/Quotas/Widgets/quotas_slider.dart';

class Quotas extends StatefulWidget {
 Quotas({Key? key, required this.quotas, required this.valor}) : super(key: key);
  String ?quotas;
  String ?valor;
  @override
  _QuotasState createState() => _QuotasState();
}

class _QuotasState extends State<Quotas> {
  
  final QuotasController controller = Get.put(QuotasController());
  final api = ApiQuotas();
  @override
  void initState() {
    super.initState();
    controller.onInit();
    api.postQuotas();
  }
  @override
  Widget build(BuildContext context) {
    final QuotasController controller = Get.put(QuotasController());
    String quotas = controller.current.toString();
    return
     WillPopScope(child: Center(
        child: MainList(conteudo: [
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          CardQuotas(),
          SizedBox(
            height: 50.sp,
          ),
          MainText(
              text: QuotasTexts.available,
              font: 18,
              color: AppCores.darkbluecyan),
          SizedBox(
            height: 20.sp,
          ),
          QuotasSlider(availableQuotas: quotas.replaceAll('.', ''), maxQuotas: '70000000'),
          SizedBox(
            height: 50.sp,
          ),
        ],
      ),
    ])),onWillPop: ()async=>false,);
  }
}
