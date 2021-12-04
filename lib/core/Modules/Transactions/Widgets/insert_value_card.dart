import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertValueCard extends StatefulWidget {
  final String value;
  const InsertValueCard({Key? key, required this.value}) : super(key: key);

  @override
  _InsertValueCardState createState() => _InsertValueCardState();
}

class _InsertValueCardState extends State<InsertValueCard> {
  final PurchaseController controller = Get.put(PurchaseController());
  final api = Apisaldo();
  String ?teste;
       
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    
    @override
    void initState() async
    {
        var prefs = await SharedPreferences.getInstance();
      super.initState();
      String? teste = controller.saldo = prefs.getString("saldo");      
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      color: AppCores.pureWhite,
      width: 250.sp,
      height: 60.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Saldo Disponível em conta',
                maxLines: 2,
                minFontSize: 8,
                style: TextStyle(
                    color: AppCores.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 8.sp),
              ),
              SizedBox(
                height: 3.sp,
              ),
              AutoSizeText(
                widget.value,
                maxLines: 3,
                minFontSize: 10,
                style: TextStyle(
                    color: AppCores.mainGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp),
              ),
            ],
          ),
          GestureDetector(
            child: isVisible == true
                ? Icon(
                    Icons.visibility_outlined,
                    color: AppCores.mainGreen,
                  )
                : Icon(
                    Icons.visibility_off_outlined,
                    color: AppCores.mainGreen,
                  ),
            onTap: () {
              setState(() {
                isVisible == false ? isVisible = true : isVisible = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
