import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/four_digits_password_input.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/four_digits_singup.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';

class RegisterFourDigitsPasswordScreenSing extends StatefulWidget {
  const RegisterFourDigitsPasswordScreenSing({Key? key}) : super(key: key);

  @override
  _RegisterFourDigitsPasswordScreenSingState createState() =>
      _RegisterFourDigitsPasswordScreenSingState();
}

class _RegisterFourDigitsPasswordScreenSingState
    extends State<RegisterFourDigitsPasswordScreenSing> {
      @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackButton(body: _body());
  }
}

Widget _body() {
  
  return 
  Center(child: FourDigitsPasswordSingup(),);
}
