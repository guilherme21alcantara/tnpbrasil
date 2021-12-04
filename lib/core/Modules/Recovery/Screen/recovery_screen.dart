import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_logo.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/container_fix.dart';

class Recovery extends StatefulWidget {
  const Recovery({Key? key}) : super(key: key);
  @override
  _RecoveryState createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: _size.height * 1,
          color: AppCores.gray90,
          child: Stack(
            children: const [
              ContainerLogo(),
              ContainerFixR(),
            ],
          ),
        ),
      ),
    );
  }
}
