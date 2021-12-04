//@dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_categoria.dart';
import 'package:tnp/core/Data/Api/api_commerce.dart';
import 'package:tnp/core/Modules/Category/Widgets/header.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/category_card.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/header_logo.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/restaurant_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Modules/SignUp/Controller/sing_controller.dart';

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

  Building({this.id, this.photo, this.name, this.phone, this.urlcategory,this.cidadecategory,this.desconto,this.isFavorite, this.cod});
}

class SearchCommerce extends StatefulWidget {
  SearchCommerce({Key key}) : super(key: key);
  @override
  _SearchCommerceState createState() => _SearchCommerceState();
}

class _SearchCommerceState extends State<SearchCommerce> {
  final api_commerce = ApiCommerce();
  final SingupController controller =  SingupController();
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
  _SearchCommerceState() {
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
    api_commerce.getCommerce();
    sleep(Duration(milliseconds: 200));
    init();
  }

  void init() async{
    
       var prefs = await SharedPreferences.getInstance();
    for (int index = 0; index < prefs.getInt("indexCommerce"); index++) {
      _list = List<Building>.generate(
          prefs.getInt("indexCommerce"),
          (i) => Building(
              name: prefs.getString("nomeCommerce$i"),
              photo: prefs.getString("imgblob$i"),
              id: prefs.getInt("id$i"),
              urlcategory: prefs.getString("urlcategory$i"),
              cidadecategory: prefs.getString("cidadecategory$i"),
              desconto: prefs.getString("desconto$i"),
              cod: prefs.getInt("codC$i")
              ));
      index++;

      setState(() {
        _searchList = _list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
        key: key,
        appBar: buildBar(context),
        body: ListView.builder(
          itemCount: _searchList.length,
          itemBuilder: (context, index) {
            return UiitemList(_searchList[index]);
          },
        ));
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
    return AppBar(
        elevation: 0,
        toolbarHeight: 125.sp,
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
                CategoryCard(
                  title: "Nome categoria",
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  child: appBarTitle,
                  color: AppCores.ghostwhite,
                  width: 200.sp,
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
            left: 20.sp,
            top: 55.sp,
          ),
          child: IconButton(
            iconSize: 30,
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.green,
                  );
                  this.appBarTitle = Center(
                    child: TextField(
                      controller: _searchQuery,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          hintText: "item ou comércio",
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
      child: RestaurantCard(
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
