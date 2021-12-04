import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/confirm_transaction_data_card.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/insert_value_card.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction_button.dart';

class ConfirmTransactionDataPixScreen extends StatefulWidget {
  const ConfirmTransactionDataPixScreen({Key? key}) : super(key: key);

  @override
  _ConfirmTransactionDataScreenState createState() =>
      _ConfirmTransactionDataScreenState();
}

class _ConfirmTransactionDataScreenState
    extends State<ConfirmTransactionDataPixScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }
}

Widget _body() {
  final CategoryController controller = Get.put(CategoryController());
  final CardController contro = Get.put(CardController());
  return WillPopScope(onWillPop: ()async =>false,child: MainList(conteudo: [
    InsertValueCard(
      value: controller.saldo,
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Confirme os dados de transferência',
            maxLines: 2,
            minFontSize: 8,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 20.sp,
          ),
          ConfirmTransactionDataCard(
            value: contro.valor.text,
            name: controller.nome,
            cpf: controller.cpf,
          ),
          SizedBox(
            height: 20.sp,
          ),
          Center(
              child: TransactionButtonPix(
            name: 'Transferir',
          ))
        ],
      ),
    ),
  ]),);
}
