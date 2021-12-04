import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
 import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:tnp/core/Modules/Category/Widgets/loading.dart';
import 'package:tnp/core/Modules/Quotas/Controller/quotas_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CardQuotas extends StatefulWidget {
  const CardQuotas({Key? key}) : super(key: key);

  @override
  _CardQuotasState createState() => _CardQuotasState();
}

class _CardQuotasState extends State<CardQuotas> {
  final QuotasController controller = Get.put(QuotasController());

  @override
  Widget build(BuildContext context) {
 
     
    String valor = controller.user_quotas;
      
      final _formatRealPattern =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  
      
    return Container(
      
      child: Column(
        children: [
          
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: Image.asset(
              "assets/quotas-branco.png",
              scale: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.sp),
            child: Text(
              'Minhas Quotas',
              style: TextStyle(color: AppCores.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: 
            Text(
              '${_formatRealPattern
              .format(int.parse(valor).toInt())}',
              style: TextStyle(
                color: AppCores.green,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      height: 90.sp,
      width: 150.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppCores.darkbluecyan,
      ),
    );
    
  }
  
}
