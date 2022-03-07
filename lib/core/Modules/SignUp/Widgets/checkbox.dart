import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_sem_recorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_comrecorrencia.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCheckboxTerm extends StatefulWidget {
  final String texto;
  const CustomCheckboxTerm({Key? key, required this.texto}) : super(key: key);

  @override
  _CustomCheckboxTermState createState() => _CustomCheckboxTermState();
}

class _CustomCheckboxTermState extends State<CustomCheckboxTerm> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final apiCard = ApiCartao();
    final CardController controller = Get.put(CardController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (value) async {
            setState(() {
              isChecked = value!;
            });
            if (isChecked) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Termos de uso"),
                      content: Text("Deseja ler os termos de uso?"),
                      actions: [
                        ElevatedButton(
                          child: Text("Não"),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text("Sim"),
                          onPressed: () async {
                            await launch(
                                'https://todosnospodemos.com.br/politica-de-privacidade-2/');
                          },
                        ),
                      ],
                    );
                  });
            } else {
              //controller.recorrencia = false;
            }
          },
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: Text(widget.texto),
        )
      ],
    );
  }
}
