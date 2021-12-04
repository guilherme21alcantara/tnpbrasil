//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tnp/Routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import 'Routes/app_routes.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      title: 'TNP',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.initial,
      color: Colors.white,
    );
  }));
}
