//@dart=2.9

// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:tnp/core/Data/Api/urls.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

class ApiSing extends GetView<SingupController> {
  static String urlSingUp = Urls.urlSingUp;
//POST_SingUp
  postSingUp() async {
    // ignore: unnecessary_string_interpolations
    final String url = '$urlSingUp';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['nome'] = controller.nameController.text;
    request.fields['email'] = controller.emailController.text;
    request.fields['cpf'] = controller.cpfController.text;
    request.fields['celular'] = controller.celularController.text;
    request.fields['senha'] = controller.passwordController.text;
    request.fields['senha2'] = controller.passController.text;
    request.fields['aniversario'] = controller.dataController.text;
    request.fields['estado'] = controller.id.toString();
    request.fields['cidade'] = controller.idCity.toString();
    request.fields['bairro'] = controller.bairroController.text;
    request.fields['rua'] = controller.ruaController.text;
    request.fields['numero'] = controller.numController.text;
    request.fields['cep'] = controller.cepController.text;
    request.fields['pai'] = '1';

    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      print("object");
    } else {
      print("2");
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
