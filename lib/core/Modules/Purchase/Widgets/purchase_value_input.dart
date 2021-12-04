import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Screen/inform_password_screen.dart';

class PurchaseInput extends StatefulWidget {
  final String placeholder;
  const PurchaseInput({Key? key, required this.placeholder}) : super(key: key);

  @override
  _PurchaseInputState createState() => _PurchaseInputState();
}

class _PurchaseInputState extends State<PurchaseInput> {
  @override
  Widget build(BuildContext context) {
    final PurchaseController purchase = Get.put(PurchaseController());
    
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(vertical:isPortrait==true? 15.sp: _size.height*0.2),
      child: Container(
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(20)),
        height:isPortrait==true? _size.height*0.3: _size.height*0.8,
        width: 250.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainText(
                text: PurchaseTexts.informPurchasePrice,
                font: 12.sp,
                color: AppCores.darkbluecyan),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 25.sp),
              child: TextFormField(
                  inputFormatters: 
          [
             FilteringTextInputFormatter.digitsOnly,
            RealInputFormatter(moeda: false,centavos: true)
          ],
                controller: purchase.compra,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: AppCores.gray90,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: widget.placeholder,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15.sp, bottom: 12.sp, right: 15.sp),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppCores.ghostwhite),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppCores.ghostwhite),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
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
                  print(purchase.compra.text);
                  if(purchase.compra.text != '')
                  {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InformPasswordScreen()),
                  );
                  }
                },
                child: Center(
                  child: Text(
                    PurchaseTexts.payButton,
                    style: TextStyle(color: AppCores.white, fontSize: 12.sp),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
