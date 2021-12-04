import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_logo.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Recovery/Widgets/container_fix.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/container_personaldata.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);
  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
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
              ContainerPersonal(),
            ],
          ),
        ),
      ),
    );
  }
}
