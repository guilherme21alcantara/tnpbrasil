// @dart=2.9
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/api_quotas.dart';

class PixController extends GetxController {
 
  var client = http.Client();
  String chave;
  PixController();
  @override
  void onInit() async {
    var prefs = await SharedPreferences.getInstance();
    super.onInit();
    chave = prefs.getString("chave");
  }

  

}
