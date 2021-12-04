import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Data/Api/api_password.dart';
import 'package:tnp/core/Data/Api/api_recorrente.dart';
import 'package:tnp/core/Modules/Category/Widgets/loading.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insert_pix.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_sem_recorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_comrecorrencia.dart';

class FourDigitsPasswordInputPix extends StatefulWidget {
  const FourDigitsPasswordInputPix({Key? key}) : super(key: key);

  @override
  _FourDigitsPasswordInputPixState createState() =>
      _FourDigitsPasswordInputPixState();
}

class _FourDigitsPasswordInputPixState extends State<FourDigitsPasswordInputPix> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final apiPass = ApiSenha();
    final api_card = ApiCartao();
    final apicardR =ApiCartaoRecorrente();

    final RegisterPasswordController controller =
        Get.put(RegisterPasswordController());
    
    return WillPopScope(onWillPop: () async => false ,child: Padding(
      padding: EdgeInsets.symmetric(vertical: 18.sp),
      child: Container(
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(20)),
        height: _size.height * 0.3,
        width: 250.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(
                text: 'Informe uma senha de 4 dígitos',
                font: 12.sp,
                color: AppCores.darkbluecyan),
            SizedBox(
              height: 15.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.sp),
              child: PinCodeTextField(
                controller: controller.pix,
                cursorColor: AppCores.darkbluecyan,
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 30.sp,
                    fieldWidth: 30.sp,
                    activeFillColor: AppCores.gray95,
                    inactiveColor: AppCores.gray95,
                    activeColor: AppCores.gray95,
                    inactiveFillColor: AppCores.gray95,
                    selectedColor: AppCores.gray90,
                    selectedFillColor: AppCores.gray90),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: AppCores.pureWhite,
                enableActiveFill: true,
                onCompleted: (v) {},
                appContext: context,
                onChanged: (String value) {},
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(AppCores.mainGreen),
                  maximumSize:
                      MaterialStateProperty.all<Size>(Size(120.sp, 27.sp)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(Size(120.sp, 27.sp)),
                ),
                onPressed: ()  {
                  Get.to(InsertTransactionValuePixScreen());
                },
                child: Center(
                  child: Text(
                    'Prosseguir',
                    style: TextStyle(color: AppCores.black, fontSize: 12.sp),
                  ),
                )),
          ],
        ),
      ),
    ),);
  }
}
