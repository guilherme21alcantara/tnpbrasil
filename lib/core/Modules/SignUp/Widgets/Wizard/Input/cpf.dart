import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:brasil_fields/brasil_fields.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';

// ignore: must_be_immutable
class InputCpfS extends GetView<SingupController> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              controller: controller.cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: TEXTS.textinfocpf,
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
