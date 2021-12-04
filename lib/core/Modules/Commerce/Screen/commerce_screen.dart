import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/list.dart';
import 'package:tnp/core/Modules/Home/screen.dart';

class CommerceScreen extends StatefulWidget {
  const CommerceScreen({Key? key}) : super(key: key);

  @override
  _CommerceScreenState createState() => _CommerceScreenState();
}

class _CommerceScreenState extends State<CommerceScreen> {
  @override
  Widget build(BuildContext context) {
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: AppCores.white,elevation: 0,leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){Get.to(Home());},),),
      body: Stack(
        children: [
          SearchCommerce(),
        ],
      ),
    );
  }
}
