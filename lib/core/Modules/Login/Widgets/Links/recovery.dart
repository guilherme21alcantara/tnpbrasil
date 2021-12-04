//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';

class LinksRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.only(bottom: _size.height * 0.004),
      child: Container(
        height:isPortrait==true? _size.height * 0.05: _size.height*0.2,
        width: _size.width * 0.4,
        child: TextButton(
            child: Text(
              RecoverPasswordTexts.buttonPassword,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {
              Get.toNamed(Routes.recovery);
            }),
      ),
    );
  }
}
