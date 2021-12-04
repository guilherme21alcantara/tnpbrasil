// ignore_for_file: import_of_legacy_library_into_null_safe
//@dart=2.9
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/core/Data/Api/api_commerce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Commerce/Screen/commerce_screen.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/loading.dart';

// ignore: must_be_immutable
class ListButton extends GetView<CategoryController> {
  String texto, imagem;
  int id;
  ListButton({Key key, this.texto, this.imagem, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api_commerce = ApiCommerce();
    final CategoryController controller = Get.put(CategoryController());
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.id = id;
            controller.name_category = texto;
            //         onLoadingC(context);
            api_commerce.getCommerce();
            sleep(Duration(milliseconds: 200));
            Future.delayed(Duration(milliseconds: 800), () async{

                var prefs = await SharedPreferences.getInstance();
                 Get.to(CommerceScreen());
              
            });
            // api_commerce.getCommerce();
            // Get.to(CommerceScreen());
          },
          child: Column(
            children: [
              Container(
                height: 40.sp,
                width: 50.sp,
                child: Image.network(
                  imagem,
                  scale: 5,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppCores.darkbluecyan,
                ),
              ),
            ],
          ),
        ),
        Center(child: Text(texto, style: TextStyle(fontSize: 11)))
        
      ],
    );
  }
}
