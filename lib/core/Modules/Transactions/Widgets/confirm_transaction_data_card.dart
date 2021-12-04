import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class ConfirmTransactionDataCard extends StatefulWidget {
  final String? value;
  final String? name;
  final String? cpf;
  const ConfirmTransactionDataCard({Key? key, this.value, this.name, this.cpf})
      : super(key: key);

  @override
  _ConfirmTransactionDataCardState createState() =>
      _ConfirmTransactionDataCardState();
}

class _ConfirmTransactionDataCardState
    extends State<ConfirmTransactionDataCard> {
  final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    String valor = controller.valor.text;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      height: 140.sp,
      width: 250.sp,
      color: AppCores.pureWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'R\$ $valor',
            maxLines: 3,
            minFontSize: 8,
            maxFontSize: 16,
            style: TextStyle(
                color: AppCores.mainGreen,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 10.sp,
          ),
          AutoSizeText(
            'Nome:',
            maxLines: 3,
            minFontSize: 8,
            maxFontSize: 16,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 5.sp,
          ),
          AutoSizeText(
            widget.name!,
            maxLines: 3,
            minFontSize: 8,
            maxFontSize: 16,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 15.sp,
          ),
          AutoSizeText(
            'CPF:',
            maxLines: 3,
            minFontSize: 8,
            maxFontSize: 16,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 5.sp,
          ),
          AutoSizeText(
            widget.cpf!,
            maxLines: 3,
            minFontSize: 8,
            maxFontSize: 16,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}