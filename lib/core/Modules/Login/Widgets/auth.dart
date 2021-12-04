//@dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/core/Data/Models/db_biometria.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Screen/register_four_sing.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/four_digits_singup.dart';

class AuthApp extends StatefulWidget {
  @override
  _AuthAppState createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final dbhelper = DatabaseHelperBio.instance;
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
    try {
      authenticated = await auth.authenticateWithBiometrics(
        androidAuthStrings: AndroidAuthMessages(signInTitle: 'Autorização necessária'),
          localizedReason: "Digitalize sua impressão digital para autenticar",
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(()  {
      
      authorized = authenticated ? "Sucesso autherized" : "Falha ao autenticar";
    });
    if (authenticated) {
        Map<String, dynamic> row = {
          dbhelper.columnUser: 'Cadastrado',
        };
        final id = await dbhelper.insert(row);
        print('linha inserida id: $id');
        Get.to(RegisterFourDigitsPasswordScreenSing());
      }
  }

  @override
  void initState() {
    // TODO: implementar initState
    _checkBiometric();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: _size.height * 0.45),
              child: MainText(
                  text: 'Cadastre sua biometria para login',
                  font: 12,
                  color: AppCores.darkbluecyan),
            ),
            Padding(
              padding: EdgeInsets.only(top: _size.height * 0.06),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    _authenticate();
                  },
                  child: Text("Cadastrar biometria"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
