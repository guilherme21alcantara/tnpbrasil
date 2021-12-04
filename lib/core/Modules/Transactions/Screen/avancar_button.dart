import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Data/Api/api_card_singup.dart';
import 'package:tnp/core/Data/Api/api_pix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_recorrente.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/PIX/Screen/pix.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class AvancarButton extends StatefulWidget {
  final String name;
  final String goTo;
  const AvancarButton({Key? key, required this.name, required this.goTo})
      : super(key: key);

  @override
  _AvancarButtonState createState() => _AvancarButtonState();
}

class _AvancarButtonState extends State<AvancarButton> {
  final CardController controller = Get.put(CardController());
  final apicard = ApiCartaoRecorrente();
  @override
  Widget build(BuildContext context) {
    final RegisterPasswordController controller =
        Get.put(RegisterPasswordController());
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppCores.mainGreen),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 90.sp, vertical: 10.sp))),
      onPressed: () async {
        Get.toNamed(widget.goTo);
      },
      child: Text(
        widget.name,
        style: TextStyle(color: AppCores.black, fontSize: 12.sp),
      ),
    );
  }
}
