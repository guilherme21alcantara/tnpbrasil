import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/available_balance.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/header.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/indicate_card.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/purchase_value_input.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }

  Widget _body() {
    final PurchaseController purchase = Get.put(PurchaseController());

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return ListView(
      physics:isPortrait==true? NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 15.sp,
        ),
        PurchaseHeader(
            name: purchase.title, description: '', urlcategory: purchase.urlcategory, cidadecategory: purchase.cidadecategory, desconto: purchase.desconto,),
        PurchaseInput(placeholder: ''),
        AvailableBalance(balance: purchase.saldo),
        IndicateCard()
      ],
    );
  }
}
