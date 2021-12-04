import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Data/Models/db_salva.dart';
import 'package:tnp/core/Data/db_table.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';

// ignore: must_be_immutable
class InputEmail extends GetView<LoginController> {
  
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
     final LoginController controller = Get.put(LoginController());
    return Form(
        child: Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller:controller.emailController.text!=''? controller.emailController:controller.emailc,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: LoginTexts.inputEmail,
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
