import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnp/core/Data/Api/api_card_nao_recorrente.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_sem_recorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_comrecorrencia.dart';

class CustomCheckbox extends StatefulWidget {
  final String texto;
  const CustomCheckbox({Key? key, required this.texto}) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  final LoginController contro = Get.put(LoginController());
  bool? isChecked ;
  @override
  void initState() {
    
    super.initState();
    if (contro.sav == true) {
      isChecked =true;  
    }
    else{isChecked = false;}
  }
  
  
  

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
            if(isChecked!)
            {
              controller.recorrencia = true;

             
            }else
            {
             controller.recorrencia = false;
             
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
