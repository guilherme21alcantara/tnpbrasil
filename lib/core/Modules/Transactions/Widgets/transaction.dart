import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Data/Api/api_card_singup.dart';
import 'package:tnp/core/Data/Api/api_pix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_recorrente.dart';
import 'package:tnp/core/Modules/PIX/Screen/pix.dart';
import 'package:tnp/core/Modules/PIX/Widgets/loading.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class TransactionButtonPix extends StatefulWidget {
  final String name;
  
  const TransactionButtonPix({Key? key, required this.name,})
      : super(key: key);

  @override
  _TransactionButtonState createState() => _TransactionButtonState();
}

class _TransactionButtonState extends State<TransactionButtonPix> {
  final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    final CardController contro = Get.put(CardController());
    final apipix = ApiPix();
    return WillPopScope(onWillPop: ()async=> false, child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppCores.mainGreen),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 90.sp, vertical: 10.sp))),
      onPressed: () {
        apipix.postPix();  
        onLoadingPix(context);
    //  Get.toNamed(Routes.pix);
      },
      child: Text(
        widget.name,
        style: TextStyle(color: AppCores.black, fontSize: 12.sp),
      ),
    ),);
  }
}
