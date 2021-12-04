//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Category/saldo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';

class Header extends StatefulWidget {
  const Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final PurchaseController controller = Get.put(PurchaseController());
  final LoginController contro = Get.put(LoginController());
  final api = Apisaldo();
  final cat = ApiCategory();
  
   void initState(){
    super.initState();
    api.postSaldo();
    
  }
  @override
  Widget build(BuildContext context) {
    //bool contro.test = ;

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    String valor = controller.saldo;
    return Padding(
        padding: EdgeInsets.only(top:isPortrait==true? 1.sp: _size.height*0.01, bottom:isPortrait==true? 5.sp: _size.height*0.00),
        child: Center(
            child: Column(children: [
          Text(
            ProfileTexts.availableBalance,
            style: TextStyle(
              fontSize:isPortrait==true? 18.sp: 15.sp,
              color: Colors.black,
              inherit: false,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top:isPortrait==true? 1.sp: _size.height*0.001, bottom:isPortrait==true? 5.sp: _size.height*0.0001, left: 20.sp),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //SaldoVisi(),
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
                       controller.saldo = prefs.getString("saldo");
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
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.transactions);
                  },
                )
              ]))
        ])));
  }
}
