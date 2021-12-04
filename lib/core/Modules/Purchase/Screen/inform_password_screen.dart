import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/available_balance.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/four_digit_pass_input.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/header.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/indicate_card.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';

class InformPasswordScreen extends StatefulWidget {
  const InformPasswordScreen({Key? key}) : super(key: key);

  @override
  _InformPasswordcreenSState createState() => _InformPasswordcreenSState();
}

class _InformPasswordcreenSState extends State<InformPasswordScreen> {
  bool isVisible = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }

  Widget _body() {
    final PurchaseController purchase = Get.put(PurchaseController());

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(
      onWillPop: ()async => false,
      child: ListView(
      physics:isPortrait==true? NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 14.sp,
        ),
        PurchaseHeader(
          name: purchase.title,
          description: '',
          urlcategory: purchase.urlcategory,
          cidadecategory: purchase.cidadecategory,
          desconto: purchase.desconto,
        ),
        FourDigitInput(),
        AvailableBalance(balance: purchase.saldo),
        IndicateCard()
      ],
    ),);
  }
}
