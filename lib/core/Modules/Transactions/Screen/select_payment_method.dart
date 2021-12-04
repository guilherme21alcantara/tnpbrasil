import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Modules/Extract/Screen/extract_scaffold.dart';
import 'package:tnp/core/Modules/Extract/Screen/extract_screen.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction_card.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  const SelectPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _SelectPaymentMethodScreenState createState() =>
      _SelectPaymentMethodScreenState();
}

class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }
}

Widget _body() {
  return WillPopScope(
    onWillPop: () async => false,
    child: MainList(conteudo: [
      Center(
        child: Column(
          children: [
            TransactionCard(
              goTo: Routes.registerFourDigitsPasPix,
              iconData: Icons.payments_outlined,
              title: 'PIX',
              description: 'Faça transferências via PIX.',
            ),
            SizedBox(
              height: 20.sp,
            ),
            TransactionCard(
              goTo: Routes.registerCard,
              iconData: Icons.credit_card,
              title: 'Cartão',
              description: 'Cadastre um cartão.',
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rotate_right,
                    size: 20.sp,
                    color: AppCores.mainGreen,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: SizedBox(
                      width: 200.sp,
                      child: GestureDetector(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          AutoSizeText(
                              'Movimentações',
                              maxLines: 2,
                              minFontSize: 8,
                              style: TextStyle(
                                  color: AppCores.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp),
                            ),
                          SizedBox(
                            height: 1.sp,
                          ),
                          AutoSizeText(
                            'Todas suas movimentações',
                            maxLines: 3,
                            minFontSize: 8,
                            style: TextStyle(
                                color: AppCores.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp),
                          ),
                        ],
                      ),
                      onTap: ()
                      {
                        Get.to(Extract());
                      },
                      )
                      //
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.support_agent,
                    size: 20.sp,
                    color: AppCores.mainGreen,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: SizedBox(
                      width: 200.sp,
                      child: GestureDetector(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Suporte',
                            maxLines: 2,
                            minFontSize: 8,
                            style: TextStyle(
                                color: AppCores.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 1.sp,
                          ),
                          AutoSizeText(
                            'Se ocorrer algum problema, fale conosco',
                            maxLines: 3,
                            minFontSize: 8,
                            style: TextStyle(
                                color: AppCores.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp),
                          ),
                        ],
                      ), 
                      onTap: ()async
                      {
                        
                     await launch('https://wa.me/+5547992888416?text=Olá desejo atendimento!');
                      },
                      )
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}
