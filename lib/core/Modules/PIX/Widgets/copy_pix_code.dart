import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:social_share/social_share.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Controller/rigister_password.dart';
import 'package:tnp/core/Modules/PIX/Controller/pix_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class CopyPIXCode extends StatefulWidget {
  final String code;
  const CopyPIXCode({Key? key, required this.code}) : super(key: key);

  @override
  _CopyPIXCodeState createState() => _CopyPIXCodeState();
}

class _CopyPIXCodeState extends State<CopyPIXCode> {
  @override
  Widget build(BuildContext context) {
    final CardController card = Get.put(CardController());  
    final PixController controller = Get.put(PixController());
    final RegisterPasswordController con = Get.put(RegisterPasswordController());
    Size _size = MediaQuery.of(context).size;
    return WillPopScope(child: Padding(
      padding: EdgeInsets.all(5.sp),
      child: Container(
        height: _size.height * 0.25,
        width: 290.sp,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(10)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.sp, top: 15.sp),
              child: Text(
                'Copie a chave PIX',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  inherit: false,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              height: _size.height * 0.046,
              width: 200.sp,
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                color: AppCores.gray95,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: AutoSizeText(
                  controller.chave,
                  maxLines: 1,
                  minFontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppCores.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
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
                  SocialShare.copyToClipboard(controller.chave);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Sucesso"),
                          content: Text("sua chave foi copiada com sucesso"),
                          actions: [
                            ElevatedButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.pop(context);
                                con.pass.clear();
                                con.pix.clear();
                                card.valor.clear();
                              },
                            )
                          ],
                        );
                      });
                },
                child: Center(
                  child: Text(
                    'Copiar chave',
                    style: TextStyle(color: AppCores.black, fontSize: 12.sp),
                  ),
                )),
          ],
        ),
      ),
    ), onWillPop: ()async=>false,);
  }
}
