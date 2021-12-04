//@dart=2.9

import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
class bio extends GetxController
{ LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;
  List<BiometricType> _availableBiometric;
  String authorized = "Not authorized";

  
  Future<void> checkBiometric() async{
    bool canCheckBiometric;
    canCheckBiometric = await auth.canCheckBiometrics;
  }
}
