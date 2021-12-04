import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class InsertValueInput extends StatefulWidget {
  const InsertValueInput({Key? key}) : super(key: key);

  @override
  _InsertValueInputState createState() => _InsertValueInputState();
}

class _InsertValueInputState extends State<InsertValueInput> {
  @override
  Widget build(BuildContext context) {
    final CardController controller = Get.put(CardController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText( 
          'Insira o valor',
          maxLines: 2,
          minFontSize: 8,
          style: TextStyle(
              color: AppCores.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),
        AutoSizeText(
          'Valor (R\$)',
          maxLines: 2,
          minFontSize: 8,
          style: TextStyle(
              color: AppCores.black,
              fontWeight: FontWeight.w400,
              fontSize: 8.sp),
        ),
        TextField( 
          inputFormatters: 
          [
             FilteringTextInputFormatter.digitsOnly,
            RealInputFormatter(moeda: false,centavos: true)
          ],
          controller: controller.valor,
          keyboardType: TextInputType.number,
        )
      ],
    );
  }
}
