import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';

// ignore: must_be_immutable

class SaldoVisi extends StatefulWidget {
  const SaldoVisi({Key? key}) : super(key: key);

  @override
  _SaldoVisiState createState() => _SaldoVisiState();
}

class _SaldoVisiState extends State<SaldoVisi> {
  @override
  Widget build(BuildContext context) {

  final PurchaseController controller = Get.put(PurchaseController());
  final api = Apisaldo();
    final LoginController controllers = Get.put(LoginController());
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
            width: _size.width * 0.4,
            decoration: BoxDecoration(
                color: AppCores.white,
                border: Border.all(color: AppCores.white),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              readOnly: true,
              obscureText: controllers.test,

              initialValue: controller.saldo,
              decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 15, top: 15),
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  child: controllers.test == true
                      ? Icon(Icons.visibility, color: AppCores.mainGreen,)
                      : Icon(Icons.visibility_off, color: AppCores.mainGreen,),
                  onTap: () {
                    api.postSaldo();
                    sleep(Duration(microseconds: 10));
                    setState(() {
                      controllers.test == false
                          ? controllers.test = true
                          : controllers.test = false;
                    });
                  },
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            )));
  }
}
