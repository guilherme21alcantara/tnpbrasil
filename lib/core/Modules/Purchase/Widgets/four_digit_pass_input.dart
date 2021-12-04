import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/loading.dart';

class FourDigitInput extends StatefulWidget {
  const FourDigitInput({Key? key}) : super(key: key);

  @override
  _FourDigitInputState createState() => _FourDigitInputState();
}

class _FourDigitInputState extends State<FourDigitInput> {
  @override
  Widget build(BuildContext context) {
    final PurchaseController purchase = Get.put(PurchaseController());
  
    
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Size _size = MediaQuery.of(context).size;
    return WillPopScope(onWillPop: ()async => false,child: Padding(
      padding: EdgeInsets.symmetric(vertical: 18.sp),
      child: Container(
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(20)),
        height:isPortrait==true? _size.height*0.2: _size.height*0.8,
        width: 250.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(
                text: PurchaseTexts.informPassword,
                font: 12.sp,
                color: AppCores.darkbluecyan),
            SizedBox(
              height: 15.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.sp),
              child: PinCodeTextField(
                controller: purchase.password,
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
                onPressed: () {
                  WillPopScope(onWillPop: ()async=> false,child: onLoadingComercio(context), );
                },
                child: Center(
                  child: Text(
                    PurchaseTexts.confirmButton,
                    style: TextStyle(color: AppCores.black, fontSize: 12.sp),
                  ),
                )),
          ],
        ),
      ),
    ),);
  }
}
