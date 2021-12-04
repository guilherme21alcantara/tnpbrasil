
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';

// ignore: must_be_immutable
class InputCityS extends StatefulWidget {
  List controller;
   InputCityS({ Key? key, required this.controller }) : super(key: key);

  @override
  _InputCitySState createState() => _InputCitySState();
}

class _InputCitySState extends State<InputCityS> {
  @override
  Widget build(BuildContext context) {
    final SingupController controller = Get.put(SingupController());
    final api = ApiCategoria();
    final cat = ApiCategory();
    var itens;
    Size _size = MediaQuery.of(context).size;
    setState(() {
       itens = controller.city;
  
    });
    return Form(
        child: Container(
            width: _size.width * 0.8,
            height:  _size.height * 0.075,
            decoration: BoxDecoration(
                color: AppCores.gray95,
                border: Border.all(color: AppCores.gray95),
                borderRadius: BorderRadius.circular(10)),
            child: 
            
            DropdownSearch<dynamic>(
                    showSearchBox: true,
                    
                      mode: Mode.MENU,
                      items: widget.controller,
                      onChanged: (value) {
                       controller.cityController.text = value;
                        int idCity = controller.city
                    .lastIndexWhere((element) => element == value)
                    .toInt()+1;
                    print(idCity);
                    controller.idCity = idCity;
                    cat.getCategory();
                    api.getCategoria();
                      },
                      selectedItem: TEXTS.textcity),));
  }
}
