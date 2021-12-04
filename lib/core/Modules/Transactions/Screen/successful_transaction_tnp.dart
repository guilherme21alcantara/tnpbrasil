import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Models/category.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/basic_success.dart';

class SuccessfulTransactionsScreenTnp extends StatefulWidget {
  const SuccessfulTransactionsScreenTnp({Key? key}) : super(key: key);

  @override
  _SuccessfulTransactionsScreenTnpState createState() =>
      _SuccessfulTransactionsScreenTnpState();
}

class _SuccessfulTransactionsScreenTnpState
    extends State<SuccessfulTransactionsScreenTnp> {
  ScreenshotController screenshotController = ScreenshotController();
  final apisa = Apisaldo();
  final ext = ApiExtract();
  final apiext = ApiExtract();
  final CardController controller = Get.put(CardController());
  final PurchaseController purchase = Get.put(PurchaseController());
  final CategoryController category = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apisa.postSaldo();
    controller;
    ext.postExtrato();
    purchase;
    category;
    purchase.date;
  }

  @override
  Widget build(BuildContext context) {
    final api = ApiExtract();
    final apis = Apisaldo();
    final RegisterPasswordController contro =
        Get.put(RegisterPasswordController());
    return WillPopScope(onWillPop: ()async=>false, child: ScaffoldBackButton(
        body: MainList(conteudo: [
      Center(
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                color: Colors.white,
                child: BasicSuccess(
                    title: "Pagamento Realizado",
                    value: (DateTime.now().day.toString() +
                        '/' +
                        DateTime.now().month.toString() +
                        '/' +
                        DateTime.now().year.toString() +
                        '   ' +
                        DateTime.now().hour.toString().padLeft(2,'0')  +
                        ':'+
                        DateTime.now().minute.toString().padLeft(2,'0')
                        ),
                    value2: purchase.compra.text,
                    isTransaction: true,
                    pagadorName: purchase.nome,
                    pagadorCPF: purchase.cpf,
                    destinatarioName: purchase.title,
                    destinatarioCPF: purchase.cnpj,
                    paymentMethod: 'paymentMethod'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppCores.mainGreen),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          horizontal: 90.sp, vertical: 10.sp))),
              onPressed: () {
                // controller.valor.clear();
                //con.pass.clear();
                //  apipix.postPix()  ;
                contro.pass.clear();
                contro.pix.clear();
                api.postExtrato();
                apis.postSaldo();
                purchase.compra.clear();
                controller.valor.clear();
                purchase.password.clear();

                screenshotController
                    .capture(delay: Duration(milliseconds: 1))
                    .then((capturedImage) async {
                  ShowCapturedWidget(context, capturedImage!);
                }).catchError((onError) {
                  print(onError);
                });
              },
              child: Text(
                'Compartilhar',
                style: TextStyle(color: AppCores.black, fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    ])),);
  }
}

Future<dynamic> ShowCapturedWidget(
  BuildContext context,
  Uint8List capturedImage,
) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Compartilhar"),
        backgroundColor: AppCores.mainGreen,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            capturedImage != null ? Image.memory(capturedImage) : Container(),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppCores.mainGreen),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          horizontal: 90.sp, vertical: 10.sp))),
              onPressed: () {
                shareImage(capturedImage);
              },
              child: Text(
                'Compartilhar via',
                style: TextStyle(color: AppCores.black, fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Future shareImage(Uint8List img) async {
  final dir = await getApplicationDocumentsDirectory();
  final image = File('${dir.path}/assets.png');
  image.writeAsBytesSync(img);

  await Share.shareFiles([image.path]);
}
