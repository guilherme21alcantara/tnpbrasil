import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_logo.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/container_access.dart';



class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
              ContainerAccess(),
            ],
          ),
        ),
      ),
    );
  }
}
