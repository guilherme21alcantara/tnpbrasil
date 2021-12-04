import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Data/Api/api_card_singup.dart';
import 'package:tnp/core/Data/Api/api_pix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_recorrente.dart';
import 'package:tnp/core/Modules/PIX/Screen/pix.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Screen/onloading_sem_recorrencia.dart';

class TransactionButtonSemRecorrencia extends StatefulWidget {
  final String name;
  
  const TransactionButtonSemRecorrencia({Key? key, required this.name})
      : super(key: key);

  @override
  _TransactionButtonSemRecorrenciaState createState() => _TransactionButtonSemRecorrenciaState();
}

class _TransactionButtonSemRecorrenciaState extends State<TransactionButtonSemRecorrencia> {
  final CardController controller = Get.put(CardController());
  final apiCard = ApiCartao();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppCores.mainGreen),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 90.sp, vertical: 10.sp))),
      onPressed: () async{
        var prefs = await SharedPreferences.getInstance();
        prefs.remove('saldo'); 
        apiCard.postCartao();
        onLoadingNaoRecorrente(context);
        
      },
      child: Text(
        widget.name,
        style: TextStyle(color: AppCores.black, fontSize: 12.sp),
      ),
    );
  }
}
