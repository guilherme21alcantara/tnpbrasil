import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/fou_digits_pass_pix.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/four_digits_password_input.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';

class RegisterFourDigitsPasswordScreenPix extends StatefulWidget {
  const RegisterFourDigitsPasswordScreenPix({Key? key}) : super(key: key);

  @override
  _RegisterFourDigitsPasswordScreenPixState createState() =>
      _RegisterFourDigitsPasswordScreenPixState();
}

class _RegisterFourDigitsPasswordScreenPixState
    extends State<RegisterFourDigitsPasswordScreenPix> {
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
  return Center(child: FourDigitsPasswordInputPix(),);
}
