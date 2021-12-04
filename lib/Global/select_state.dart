import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_category_delete.dart';
import 'package:tnp/core/Data/Api/api_city.dart';
import 'package:tnp/core/Data/Api/api_estate.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Texts/const_texts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/city.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/loading.dart';

class InputState extends StatefulWidget {
  const InputState({ Key? key }) : super(key: key);

  @override
  _InputStateState createState() => _InputStateState();
}

class _InputStateState extends State<InputState> {
  Widget build(BuildContext context) {
    final api_city = ApiCity();

 

    final SingupController controller = Get.put(SingupController());
    Size _size = MediaQuery.of(context).size;
    return Form(
        child: Container(
      width: _size.width * 0.8,
      height: _size.height * 0.075,
      decoration: BoxDecoration(
          color: AppCores.gray95,
          border: Border.all(color: AppCores.gray95),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownSearch<dynamic>(
          mode: Mode.MENU,
          items: controller.list,
          //popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: (value) async {
            var prefs = await SharedPreferences.getInstance();
            int a = controller.list
                    .lastIndexWhere((element) => element == value)
                    .toInt() +
                1;
            controller.id = a;
            api_city.getCity();
            controller.read = true;
            controller.stateController.text = value;
            onLoadingC(context);
            print(controller.stateController.text);
          },
          selectedItem: controller.stateController.text == null
              ? controller.stateController.text              
              :TEXTS.textestate ),
    ));
  }
}
