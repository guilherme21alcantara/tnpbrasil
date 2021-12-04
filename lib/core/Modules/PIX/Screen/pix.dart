import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/core/Modules/PIX/Controller/pix_controller.dart';
import 'package:tnp/core/Modules/PIX/Widgets/copy_pix_code.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';

class PIXScreen extends StatefulWidget {
  const PIXScreen({Key? key}) : super(key: key);

  @override
  _PIXScreenState createState() => _PIXScreenState();
}

class _PIXScreenState extends State<PIXScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    
    return ScaffoldBackButton(body: _body());
  }
}

Widget _body() {
  final PixController controller= Get.put(PixController());
  return WillPopScope(onWillPop: ()async=>false,child: Column(
    children: [
      SizedBox(
        height: 25.sp,
      ),
      CopyPIXCode(
        code: controller.chave,
      )
    ],
  ),);
}
