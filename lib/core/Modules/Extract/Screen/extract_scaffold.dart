import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';

// ignore: import_of_legacy_library_into_null_safe

import 'package:tnp/core/Modules/Extract/Screen/extract_screen.dart';
import 'package:tnp/core/Modules/Home/screen.dart';

class Extract extends StatefulWidget {
  const Extract({Key? key}) : super(key: key);

  @override
  _ExtractState createState() => _ExtractState();
}

class _ExtractState extends State<Extract> {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.arrow_back),color: AppCores.black,),
        ),
        body: ExtractScreen(),
      ),
    );
  }
}
