import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Transactions/Widgets/transaction_button.dart';

class BasicSuccess extends StatefulWidget {
  final String title;
  final String value;
  final String value2;
  final bool isTransaction;
  final String pagadorName;
  final String pagadorCPF;
  final String destinatarioName;
  final String destinatarioCPF;
  final String paymentMethod;
  const BasicSuccess(
      {Key? key,
      required this.title,
      required this.value,
      required this.value2,
      required this.isTransaction,
      required this.pagadorName,
      required this.pagadorCPF,
      required this.destinatarioName,
      required this.destinatarioCPF,
      required this.paymentMethod})
      : super(key: key);

  @override
  _BasicSuccessState createState() => _BasicSuccessState();
}

class _BasicSuccessState extends State<BasicSuccess> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          Icon(
            Icons.check_box_outlined,
            color: AppCores.mainGreen,
            size: 100.sp,
          ),
          AutoSizeText(
            widget.title,
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.mainGreen,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Divider(
            thickness: 1,
            color: AppCores.darkgray,
          ),
          SizedBox(
            height: 20.sp,
          ),
          _transactionCard(widget.isTransaction, widget.value,
              widget.destinatarioName, widget.value2, widget.pagadorName),
          SizedBox(
            height: 20.sp,
          ),
          _transactionData(
              widget.isTransaction,
              widget.pagadorName,
              widget.pagadorCPF,
              widget.destinatarioName,
              widget.destinatarioCPF,
              widget.paymentMethod)
        ],
      ),
    );
  }
}

Widget _transactionCard(
    bool isTransaction, String value, String destinatarioName, String value2, String nome) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: Icon(
              Icons.circle,
              color: AppCores.mainGreen,
              size: 7.sp,
            ),
          ),
          SizedBox(
            width: 10.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                (isTransaction) ? nome : nome,
                textAlign: TextAlign.center,
                maxLines: 3,
                minFontSize: 10,
                style: TextStyle(
                    color: AppCores.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
              ),
              AutoSizeText(
                value,
                textAlign: TextAlign.center,
                maxLines: 3,
                minFontSize: 10,
                style: TextStyle(
                    color: AppCores.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp),
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp),
            child: Icon(
              Icons.circle,
              color: AppCores.mainGreen,
              size: 7.sp,
            ),
          ),
          SizedBox(
            width: 10.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                (isTransaction) ? destinatarioName : 'Saldo atual',
                textAlign: TextAlign.center,
                maxLines: 3,
                minFontSize: 10,
                style: TextStyle(
                    color: AppCores.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
              ),
              AutoSizeText(
                'R\$ $value2',
                textAlign: TextAlign.center,
                maxLines: 3,
                minFontSize: 10,
                style: TextStyle(
                    color: AppCores.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp),
              ),
            ],
          )
        ],
      )
    ],
  );
}

Widget _transactionData(
    bool isTransaction,
    String pagadorName,
    String pagadorCPF,
    String destinatarioName,
    String destinatarioCPF,
    String paymentMethod) {
  if (isTransaction) {
    return Column(
      children: [
        AutoSizeText(
          'Dados do destinatário',
          textAlign: TextAlign.center,
          maxLines: 3,
          minFontSize: 10,
          style: TextStyle(
              color: AppCores.black,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Razão Social:',
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            SizedBox(
              width: 5.sp,
            ),
            AutoSizeText(
              destinatarioName,
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'CNPJ:',
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            SizedBox(
              width: 5.sp,
            ),
            AutoSizeText(
              destinatarioCPF,
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
          ],
        ),
        SizedBox(
          height: 15.sp,
        ),
        AutoSizeText(
          'Dados do pagador',
          textAlign: TextAlign.center,
          maxLines: 3,
          minFontSize: 10,
          style: TextStyle(
              color: AppCores.black,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Nome:',
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            SizedBox(
              width: 5.sp,
            ),
            AutoSizeText(
              pagadorName,
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'CPF:',
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
            ),
            SizedBox(
              width: 5.sp,
            ),
            AutoSizeText(
              pagadorCPF,
              textAlign: TextAlign.center,
              maxLines: 3,
              minFontSize: 10,
              style: TextStyle(
                  color: AppCores.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
  return Column(
    children: [
      AutoSizeText(
        'Dados da transação',
        textAlign: TextAlign.center,
        maxLines: 3,
        minFontSize: 10,
        style: TextStyle(
            color: AppCores.black,
            fontWeight: FontWeight.w400,
            fontSize: 10.sp),
      ),
      SizedBox(
        height: 10.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'Nome:',
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            width: 5.sp,
          ),
          AutoSizeText(
            pagadorName,
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'CPF:',
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            width: 5.sp,
          ),
          AutoSizeText(
            pagadorCPF,
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'Pagamento:',
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          SizedBox(
            width: 8.sp,
          ),
          AutoSizeText(
            paymentMethod,
            textAlign: TextAlign.center,
            maxLines: 3,
            minFontSize: 10,
            style: TextStyle(
                color: AppCores.black,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp),
          ),
        ],
      ),
    ],
  );
}