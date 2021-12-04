import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_recovery.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';

class ButtonRecovery extends GetView {
  @override
  Widget build(BuildContext context) {
    final api_recovery = ApiRecovery();
    Size _size = MediaQuery.of(context).size;
    return Padding(padding: EdgeInsets.only(left: _size.width*0.05, top: _size.height*0.021), child: Container(
                height: _size.height * 0.09,
                width: _size.width * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppCores.green),
                  ),
                  onPressed: () {
                    api_recovery.postRecovery();
                  },
                  child: Text(
                    'Recuperar senha',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),);
  }
}
