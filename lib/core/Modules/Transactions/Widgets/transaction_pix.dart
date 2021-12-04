import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_pix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class TransactionButtonPix extends StatefulWidget {
  final String name;
  final String goTo;
  const TransactionButtonPix({Key? key, required this.name, required this.goTo})
      : super(key: key);

  @override
  _TransactionButtonPixState createState() => _TransactionButtonPixState();
}

class _TransactionButtonPixState extends State<TransactionButtonPix> {
  final CardController controller = Get.put(CardController());
  final PurchaseController purchase = Get.put(PurchaseController());
  @override
  Widget build(BuildContext context) {
    final apipix = ApiPix();
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppCores.mainGreen),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 90.sp, vertical: 10.sp))),
      onPressed: () async {
        // controller.valor.clear();
        //con.pass.clear();
        //  apipix.postPix()  ;

        var prefs = await SharedPreferences.getInstance();
        
        prefs.remove('saldo');
       // purchase.compra.clear();

        Get.toNamed(widget.goTo);
      },
      child: Text(
        widget.name,
        style: TextStyle(color: AppCores.black, fontSize: 12.sp),
      ),
    );
  }
}
