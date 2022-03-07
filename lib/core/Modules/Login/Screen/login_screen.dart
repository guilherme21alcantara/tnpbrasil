//@dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Models/db_biometria.dart';
import 'package:tnp/core/Data/db_table.dart';
import 'package:tnp/core/Modules/Category/saldo.dart';
import 'package:tnp/core/Modules/Login/Controller/bio_controller.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Login/Widgets/Links/register.dart';
import 'package:tnp/core/Modules/Login/Widgets/auth.dart';
import 'package:tnp/core/Modules/Login/Widgets/button.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_fix.dart';
import 'package:tnp/core/Modules/Login/Widgets/container_logo.dart';
import 'package:tnp/Global/cores.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tnp/core/Modules/Login/Widgets/loading.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;
  List<BiometricType> _availableBiometric;
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    authorized = authenticated ? "Sucesso autherized" : "Falha ao autenticar";
    final dbHelperbio = DatabaseHelperBio.instance.database;
    final dbbio = await dbHelperbio;
    var resbio = await dbbio.rawQuery("SELECT * FROM bio");
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Digitalize sua impressão digital para autenticar",
          androidAuthStrings:
              AndroidAuthMessages(signInTitle: 'Autorizaçao necessaria'),
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      if (resbio.isNotEmpty && authenticated) {
        onLoading(context);
      }
    });
  }

  final bio contro = Get.put(bio());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: _size.height * 1,
            color: AppCores.gray90,
            child: Stack(
              children: [
                ContainerLogo(),
                ContainerFix(),
                Padding(
                  padding: EdgeInsets.only(
                      top: isPortrait == true
                          ? _size.height * 0.79
                          : _size.height * 0.72,
                      left: _size.width * 0.4),
                  child: IconButton(
                    icon: Icon(
                      Icons.fingerprint,
                      size: 60,
                    ),
                    onPressed: () {
                      _authenticate();

                      contro.checkBiometric();
                      Get.to(AuthApp());
                    },
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: _size.height * 0.9),
                //   child: register(
                //     textoClicavel: LoginTexts.clickLink,
                //     textoComum: LoginTexts.sigIn,
                //     function: () async {
                //       Get.toNamed(Routes.signup);
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
