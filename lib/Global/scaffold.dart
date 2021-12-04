import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/Global/select_state.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_categoria_delete.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_category_delete.dart';
import 'package:tnp/core/Data/Api/api_estate.dart';
import 'package:tnp/core/Data/Api/api_saldo.dart';
import 'package:tnp/core/Data/Models/city.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Category/Screen/category.dart';
import 'package:tnp/core/Modules/Category/Widgets/location.dart';
import 'package:tnp/core/Modules/Category/saldo.dart';
import 'package:tnp/core/Modules/Home/screen.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/city.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/estate.dart';

class ScaffoldHome extends StatefulWidget {
  final List<Widget> conteudo;

  const ScaffoldHome({
    Key? key,
    required this.conteudo,
  }) : super(key: key);

  @override
  _ScaffoldHomeState createState() => _ScaffoldHomeState();
}

class _ScaffoldHomeState extends State<ScaffoldHome> {
  int _selectedIndex = 0;
  String? teste;
  String? uf;
  final LoginController controller = Get.put(LoginController());
  final CategoryController contro = Get.put(CategoryController());
  final SingupController city = Get.put(SingupController());
  final estado = ApiEstate();
  final apiSaldo = Apisaldo();
  final cat = ApiCategory();
  final del = ApiCategoryDelete();
  @override
  void initState() {
    super.initState();
    teste = controller.local;
    uf = controller.uf2;
    apiSaldo.postSaldo();
    controller.getUserLocation();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      teste = controller.local;
      uf = controller.uf2;
      apiSaldo.postSaldo();
      city.cityList;
      contro.saldo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    final api_commerce = ApiCategoriaDelete();
    setState(() {
      if (city.cityController.text != '') {
        teste = city.cityController.text == ''
            ? controller.local
            : city.cityController.text;
        uf = city.stateController.text == ''
            ? controller.uf2
            : city.stateController.text;
      } else {
        teste = controller.local;
        uf = controller.uf2;
      }
    });
    return Scaffold(
      backgroundColor: AppCores.ghostwhite,
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 34.55,
          child: IconButton(
            icon: Icon(Icons.logout_sharp),
            color: Colors.black,
            onPressed: () async {
              exit(0);
            },
          ),
        ),
        elevation: 0,
        title: Text.rich(TextSpan(
          text: " $teste-$uf",
          style: TextStyle(color: AppCores.black, fontSize: 15),
        )),
        backgroundColor: AppCores.ghostwhite,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // IconButton(
          //     iconSize: 20.sp,
          //     onPressed: () {
          //       controller.validateEmail();
          //       controller.getUserLocation();
          //     },
          //     icon: Icon(
          //       Icons.sync_sharp,
          //       color: Colors.black,
          //     )),
          IconButton(
              iconSize: 20.sp,
              onPressed: () {
                //
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Selecione o estado'),
                        content: InputState(),
                        actions: [
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              del.getCategoryDelete();
                              
                              
                              sleep(Duration(milliseconds: 200));
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Selecione a cidade'),
                                      content:
                                          InputCityS(controller: city.cityList),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok"),
                                          onPressed: () async{
                                          
                                            var prefs = await SharedPreferences.getInstance();
                                            print(prefs.getBool("Certo"));
                                            setState(() {
                                              teste = city.cityController.text;
                                            });
                                            api_commerce.getCategoriaDelete();
                                            
                                              setState(() {
                                                if (prefs.getBool('Certo')== true)
                                                {
                                                   Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                   builder: (context) => Home()),
                                             ); 
                                                }
                                                   
                                              });
                                            
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                          )
                        ],
                      );
                    });
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppCores.mainGreen,
        type: BottomNavigationBarType.fixed,
        iconSize: 17.sp,
        unselectedItemColor: AppCores.darkbluecyan,
        unselectedLabelStyle: TextStyle(color: AppCores.darkbluecyan),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Comércios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Extratos',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.chartPie,
            ),
            label: 'Quotas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppCores.white,
        onTap: _onItemTapped,
      ),
      body: widget.conteudo[_selectedIndex],
    );
  }
}
