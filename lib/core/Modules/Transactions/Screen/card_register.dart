import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Screen/register_four_digits_password.dart';
import 'package:tnp/core/Modules/Login/Widgets/checkbox.dart';
import 'package:tnp/core/Modules/Purchase/Widgets/scaffold_back_button.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_comrecorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_sem_recorrencia.dart';

class CardRegisterScreen extends StatefulWidget {
  CardRegisterScreen({Key? key}) : super(key: key);

  @override
  _CardRegisterScreenState createState() => _CardRegisterScreenState();
}

class _CardRegisterScreenState extends State<CardRegisterScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppCores.darkerGray.withOpacity(0.7),
        width: 1,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CardController controller = Get.put(CardController());

    return WillPopScope(
      onWillPop: () async => false,
      child: ScaffoldBackButton(
          body: MainList(conteudo: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          onCreditCardWidgetChange: (creditCardBrand) {},
          cardBgColor: AppCores.mainGreen,
        ),
        CreditCardForm(
          formKey: formKey,
          obscureCvv: true,
          obscureNumber: false,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          cardHolderName: cardHolderName,
          expiryDate: expiryDate,
          themeColor: Colors.blue,
          textColor: AppCores.black,
          cardNumberDecoration: InputDecoration(
            labelText: 'Número',
            hintText: 'XXXX XXXX XXXX XXXX',
            hintStyle: TextStyle(color: AppCores.darkerGray),
            labelStyle: TextStyle(color: AppCores.darkerGray),
            focusedBorder: border,
            enabledBorder: border,
          ),
          expiryDateDecoration: InputDecoration(
            hintStyle: TextStyle(color: AppCores.darkerGray),
            labelStyle: TextStyle(color: AppCores.darkerGray),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'Data de expiração',
            hintText: 'XX/XX',
          ),
          cvvCodeDecoration: InputDecoration(
            hintStyle: TextStyle(color: AppCores.darkerGray),
            labelStyle: TextStyle(color: AppCores.darkerGray),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'CVV',
            hintText: 'XXX',
          ),
          cardHolderDecoration: InputDecoration(
            hintStyle: TextStyle(color: AppCores.darkerGray),
            labelStyle: TextStyle(color: AppCores.darkerGray),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'Dono do Cartão',
          ),
          onCreditCardModelChange: onCreditCardModelChange,
        ),
        SizedBox(
          height: 10.sp,
        ),
        CustomCheckbox(texto: "deseja que repita esta operação?"),
        SizedBox(
          height: 10.sp,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            primary: AppCores.mainGreen,
          ),
          child: Container(
            margin: EdgeInsets.all(12),
            child: Text(
              'Cadastrar',
              style: TextStyle(
                color: AppCores.white,
                fontSize: 14.sp,
              ),
            ),
          ),
          onPressed: () {
            if (cardHolderName.isNum != true) {
              controller.number = cardNumber;
              controller.date = expiryDate;
              controller.name = cardHolderName;
              controller.cvv = cvvCode;
              if (formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterFourDigitsPasswordScreen()),
                );
                //Get.put();
                //InsertTransactionValueScreen()
              }
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Nome inválido"),
                      content: Text("nome informado está inválido"),
                      actions: [
                        ElevatedButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            }
          },
        ),
      ])),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
