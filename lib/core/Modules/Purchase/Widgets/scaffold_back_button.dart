import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/Home/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/PIX/Controller/pix_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
class ScaffoldBackButton extends StatefulWidget {
  final Widget body;
  const ScaffoldBackButton({Key? key, required this.body}) : super(key: key);

  @override
  _ScaffoldBackButtonState createState() => _ScaffoldBackButtonState();
}

class _ScaffoldBackButtonState extends State<ScaffoldBackButton> {
  @override
  Widget build(BuildContext context) {

    final CardController card = Get.put(CardController());  
    final PixController pix = Get.put(PixController());
    final RegisterPasswordController regis = Get.put(RegisterPasswordController());
    final PurchaseController controller = Get.put(PurchaseController());
    return Scaffold(
      backgroundColor: AppCores.ghostwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppCores.ghostwhite,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async{
            var prefs = await SharedPreferences.getInstance();
            Get.to(Home());
            prefs.remove("saldo");
            controller.password.clear();
            controller.compra.clear();
            regis.pass.clear();
            regis.pix.clear();
            card.valor.clear();
            } ,
        ),
        
      ),
      body: widget.body,
    );
  }
}
