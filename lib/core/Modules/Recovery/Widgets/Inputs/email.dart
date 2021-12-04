import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/Recovery/Controller/recovery_controller.dart';

// ignore: must_be_immutable
class InputEmail extends GetView<RecoveryController> {
  @override
  Widget build(BuildContext context) {
    final RecoveryController controller = Get.put(RecoveryController());
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: RecoverPasswordTexts.inputEmail,
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
