import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
// ignore: import_of_legacy_library_into_null_safe

// ignore: must_be_immutable

class InputPasswordPurchase extends StatefulWidget {
  const InputPasswordPurchase({Key? key}) : super(key: key);

  @override
  _InputPasswordPurchaseState createState() => _InputPasswordPurchaseState();
}

class _InputPasswordPurchaseState extends State<InputPasswordPurchase> {
  @override
  Widget build(BuildContext context) {
    final SingupController controller = Get.put(SingupController());
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              
              controller: controller.passController,
              keyboardType: TextInputType.text,
              obscureText: controller.obscure == null? controller.obscure ==true: controller.obscure,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: controller.obscure == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      controller.obscure == false
                          ? controller.obscure = true
                          : controller.obscure = false;
                    });
                  },
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: LoginTexts.inputPassword,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppCores.gray95),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )));
  }
}
