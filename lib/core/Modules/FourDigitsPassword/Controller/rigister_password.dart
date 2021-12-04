// @dart=2.9
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/api_quotas.dart';

class RegisterPasswordController extends GetxController {
  final api = ApiQuotas();
  var client = http.Client();
  // ignore: non_constant_identifier_names
  TextEditingController pass;
  TextEditingController pix;
  RegisterPasswordController();
 
  @override
  void onInit() async {
    super.onInit();
    pass = TextEditingController();
    pix = TextEditingController();
  }

  

}
