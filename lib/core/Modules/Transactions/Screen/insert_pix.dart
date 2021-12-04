import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/insert_value_card.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/insert_value_input.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction_button.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction_pix.dart';

class InsertTransactionValuePixScreen extends StatefulWidget {
  const InsertTransactionValuePixScreen({Key? key}) : super(key: key);

  @override
  _InsertTransactionValueScreenState createState() =>
      _InsertTransactionValueScreenState();
}

class _InsertTransactionValueScreenState
    extends State<InsertTransactionValuePixScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }
}

Widget _body() {
  final CategoryController value = Get.put(CategoryController());
  return WillPopScope(
    onWillPop: () async => false,
    child: MainList(conteudo: [
    InsertValueCard(
      value: value.saldo,
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InsertValueInput(),
          SizedBox(
            height: 50.sp,
          ),
          Center(
              child: TransactionButtonPix(
            name: 'Avançar',
            goTo: Routes.confirmTransactionDataPix,
          ))
        ],
      ),
    ),
  ]),);
}
