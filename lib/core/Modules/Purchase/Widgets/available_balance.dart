import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';

class AvailableBalance extends StatefulWidget {
  final String balance;
  const AvailableBalance({Key? key, required this.balance}) : super(key: key);

  @override
  _AvailableBalanceState createState() => _AvailableBalanceState();
}

class _AvailableBalanceState extends State<AvailableBalance> {
  final PurchaseController purchase = Get.put(PurchaseController());
  final LoginController contro = Get.put(LoginController());
  final api = Apisaldo();
  
  bool isVisible = true;
   void initState(){
    super.initState();
    api.postSaldo();
    
  }
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
     String valor = purchase.saldo;
    return Padding(
      padding: EdgeInsets.only(top:isPortrait==true? 0.sp: _size.height*0.2, bottom: 10.sp),
      child: Center(
        child: Column(
          children: [
            Text(
              ProfileTexts.availableBalance,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                inherit: false,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.sp, bottom: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Offstage(
                  
                   child: Text(
                    valor,
                   style: TextStyle(
                     fontWeight: FontWeight.w800,
                     color: AppCores.mainGreen,
                     fontSize:isPortrait==true? 18.sp: 15.sp,
                   ),
                 ), offstage: contro.test,),
                 SizedBox(
                   width: 15.sp,
                 ),
                 GestureDetector(
                   onTap: () async{
                      var prefs = await SharedPreferences.getInstance();
                       api.postSaldo();

                     //print(prefs.getString('saldo'));
                     setState(() {
                       purchase.saldo = prefs.getString("saldo");
                       contro.test == false ? contro.test = true : contro.test = false;
                       print(contro.test);
                     });
                   },
                   child: contro.test == true
                       ? Icon(
                           Icons.visibility_outlined,
                           color: AppCores.mainGreen,
                         )
                       : Icon(
                           Icons.visibility_off_outlined,
                           color: AppCores.mainGreen,
                         ),
                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
