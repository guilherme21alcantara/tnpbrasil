import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';

// ignore: must_be_immutable

class InputPassword extends StatefulWidget {
  const InputPassword({Key? key}) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller:controller.passwordController.text!=''? controller.passwordController: controller.passc,
              keyboardType: TextInputType.name,
              obscureText: controller.test,
              decoration: InputDecoration(
              
                suffixIcon: GestureDetector(
                  child: controller.test == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      controller.test == false
                          ? controller.test = true
                          : controller.test = false;
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
