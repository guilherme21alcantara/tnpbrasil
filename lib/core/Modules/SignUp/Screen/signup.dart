import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_logo.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/container_fix.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
  
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final teste = SingupController();  
    teste.onInit();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: _size.height * 1,
          color: AppCores.gray90,
          child: Stack(
            children: const [
              ContainerLogo(),
              ContainerSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
