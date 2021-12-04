// //@dart=2.9

// // ignore: implementation_imports
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tnp/core/Data/Api/api_commerce.dart';
// import 'package:tnp/core/Data/Api/urls.dart';
// import 'package:tnp/core/Data/Models/commerce.dart';
// import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
// import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
// import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

// class ApiCommerceDelete extends GetView<CategoryController> {
//   static String urlCommerce = Urls.urlCommerce;
//   final LoginController contro = Get.put(LoginController());
//   final SingupController city = Get.put(SingupController());
  
// //POST_LOGIN
//   getCommerceDelete() async {
//     var prefs = await SharedPreferences.getInstance();
//     // ignore: unnecessary_string_interpolations
//     final String url = '$urlCommerce';
//     Map<String, String> headers = {
//       'Content-Type': 'multipart/form-data',
//       'Accept': 'application/json',
//     };
//     var request = http.MultipartRequest("POST", Uri.parse(url));
//     request.fields['categoria'] = controller.id.toString();
//     request.fields['cidade'] = city.cityController.text ==''? contro.local: city.cityController.text;
//     request.fields['estado'] = city.stateController.text ==''? contro.uf2: city.stateController.text;
//     request.headers.addAll(headers);

//     http.Response response =
//         await http.Response.fromStream(await request.send());
//     var mapResponse = json.decode(response.body);
     
//     if (response.statusCode == 200) {
//      print(prefs.getInt("indexCommerce"));
     
//        for (int i = prefs.getInt("indexCommerce"); i >= 0;) {
//           prefs.remove("nomeCommerce$i");
//           prefs.remove("imgblob$i");
//           prefs.remove("urlcategory$i");
//           prefs.remove("cidadecategory$i");
//           prefs.remove("desconto$i");
//           prefs.remove("codC$i");
//           print("removeu");
//           i--;
//           }
//     // api.getCommerce();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     throw UnimplementedError();
//   }
// }
