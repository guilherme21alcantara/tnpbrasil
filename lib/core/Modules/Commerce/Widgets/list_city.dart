//@dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/select_state.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_categoria_delete.dart';
import 'package:tnp/core/Data/Api/api_commerce.dart';
import 'package:tnp/core/Modules/Category/Widgets/header.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/card_city.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/category_card.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/category_card_title.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/header_logo.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/restaurant_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/Home/screen.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Input/city.dart';

class Building {
  int id;
  String photo;
  String name;
  String phone;
  String urlcategory;
  String cidadecategory;
  String desconto;
  int cod;
  bool isFavorite;

  Building(
      {this.id,
      this.photo,
      this.name,
      this.phone,
      this.urlcategory,
      this.cidadecategory,
      this.desconto,
      this.isFavorite,
      this.cod});
}

class SearchCommerceCity extends StatefulWidget {
  SearchCommerceCity({Key key}) : super(key: key);
  @override
  _SearchCommerceCityState createState() => _SearchCommerceCityState();
}

class _SearchCommerceCityState extends State<SearchCommerceCity> {
  final api_commerce = ApiCategoria();
  //api_commerce.getCategoria();
  final delete = ApiCategoriaDelete();
  final SingupController city = Get.put(SingupController());
  final SingupController controller = SingupController();
  Widget appBarTitle = Text(
    "",
    style: TextStyle(color: Colors.black),
  );

  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.green,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<Building> _list;
  List<Building> _searchList = List();

  bool _IsSearching;
  String _searchText = "";
  _SearchCommerceCityState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    
    //delete.getCategoriaDelete();
    //sleep(Duration(milliseconds: 500));
    api_commerce.getCategoria();
    sleep(Duration(milliseconds: 600));
    init();
  }

  void init() async {
    var prefs = await SharedPreferences.getInstance();
    // print(prefs.getInt("indexCommerceCa"));
    // if (prefs.getInt("indexCommerceCa") == null) {
    //   api_commerce.getCategoria();
    //   print(prefs.getInt('indexCommerceCa'));
    // } else {
    //   delete.getCategoriaDelete();
    //   print(prefs.getInt('indexCommerceCa'));
    // }
    sleep(Duration(milliseconds: 200));
    if (prefs.getInt("indexCommerceCa") != null) {
      for (int index = 0; index < prefs.getInt("indexCommerceCa"); index++) {
        _list = List<Building>.generate(
            prefs.getInt("indexCommerceCa"),
            (i) => Building(
                name: prefs.getString("nomeCommerceCa$i"),
                photo: prefs.getString("imgblobCa$i"),
                id: prefs.getInt("idCa$i"),
                urlcategory: prefs.getString("urlcategoryCa$i"),
                cidadecategory: prefs.getString("cidadecategoryCa$i"),
                desconto: prefs.getString("descontoCa$i"),
                cod: prefs.getInt("codCa$i")));
        index++;

        setState(() {
          _searchList = _list;
        });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ops!"),
              content: Text(
                  "Não existem comércios cadastrado na sua localidade, altere a cidade para continuar usando a TNP."),
              actions: [
                ElevatedButton(
                  child: Text("ok"),
                  onPressed: () async {
                    Navigator.pop(context);
                    sleep(Duration(milliseconds: 200));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Escolha um estado'),
                            content: InputState(),
                            actions: [
                              TextButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  api_commerce.getCategoria();
                                  sleep(Duration(seconds: 2));
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Selecione a cidade'),
                                          content: InputCityS(
                                              controller: city.cityList),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok"),
                                              onPressed: () async {
                                                var prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                if (prefs.getInt(
                                                        'indexCommerceCa') !=
                                                    null) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home()),
                                                  );
                                                } else {
                                                  print(prefs.getInt(
                                                      'indexCommerceCa'));
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text("Ops!"),
                                                          content: Text(
                                                              "Não foi possivel encontrar restaurante nessa localidade!"),
                                                          actions: [
                                                            ElevatedButton(
                                                              child: Text("Ok"),
                                                              onPressed: () {
                                                                //         delete.getCategoriaDelete();
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Home()),
                                                                );
                                                                //            Get.to(Home());
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      });
                                                }
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
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
          key: key,
          appBar: buildBar(context),
          body: ListView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) {
              return UiitemList(_searchList[index]);
            },
          )),
      onWillPop: () async => false,
    );
  }

  List<Building> _buildList() {
    return _list;
  }

  List<Building> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list
          .where((element) =>
              element.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      print('${_searchList.length}');
      return _searchList;
    }
  }

  Widget buildBar(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return AppBar(
        elevation: 0,
        toolbarHeight: isPortrait == true ? 125.sp : _size.height * 0.3,
        centerTitle: true,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.sp, right: 30.sp),
            child: Column(
              children: [
                HeaderLogo(),
                SizedBox(
                  height: 5.sp,
                ),
                CategoryCardTitle(
                  title: "Todos",
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  child: appBarTitle,
                  color: AppCores.ghostwhite,
                  width: isPortrait == true ? 200.sp : _size.width * 0.5,
                  height: 30.sp,
                )
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left: isPortrait == true ? 20.sp : _size.width * 0.2,
            top: 55.sp,
          ),
          child: IconButton(
            iconSize: 30,
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(
                    Icons.close,
                    color: Colors.green,
                  );
                  appBarTitle = Center(
                    child: TextField(
                      controller: _searchQuery,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          hintText: "Pesquisar comercio",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ));
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.green,
      );
      this.appBarTitle = Text(
        "",
        style: TextStyle(color: Colors.black, fontSize: 20),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class UiitemList extends StatelessWidget {
  final Building building;
  UiitemList(this.building);

  Widget build(BuildContext context) {
    return Container(
      color: AppCores.ghostwhite,
      child: RestaurantCardCity(
        photo: building.photo,
        name: building.name,
        id: building.id,
        cidadecategory: building.cidadecategory,
        urlcategory: building.urlcategory,
        desconto: building.desconto,
        cod: building.cod,
      ),
    );
  }
}
