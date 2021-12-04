//@dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_category.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Data/Models/extract.dart';
import 'package:tnp/core/Modules/Category/Screen/category.dart';
import 'package:tnp/core/Modules/Category/Widgets/header.dart';
import 'package:tnp/core/Modules/Category/Widgets/list_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Building {
  int id;
  String name;
  String image;
  Building({
    this.id,
    this.image,
    this.name,
  });
}

class SearchList extends StatefulWidget {
  //SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final cat = ApiCategory();
  var lista;
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
  List<Building> _searchList = [];

  bool _IsSearching;
  String _searchText = "";
  _SearchListState() {
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
    cat.getCategory();
    _IsSearching = false; 
    sleep(Duration(seconds: 1));
    init();
  }
  void init() async {
    var prefs = await SharedPreferences.getInstance();
    int nome = (prefs.getInt("teste"));
    print(prefs.getInt("teste"));
    if (prefs.getInt("teste")!= null && prefs.getInt("teste").toInt()!= 0)
    {
      
      for (int index = 0; index <= prefs.getInt("teste")-1;index++) {
      _list = List<Building>.generate(
          nome,
          (index) => Building(
              name: prefs.getString("nome$index"),
              image: prefs.getString("imagem$index"),
              id: prefs.getInt("id$index")));
      setState(() {
        _searchList = _list;
      });
    }
    }
    
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    //SizeConfig().init(context);
    return Scaffold(
        key: key,
        appBar: buildBar(
          context,
        ),
        body: GridView.builder(
            itemCount: _searchList.length,
            itemBuilder: (context, index) {
              return Uiitem(_searchList[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 130.sp,
              crossAxisCount: 3,
            )));
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
        toolbarHeight:isPortrait==true? 140.sp: _size.height*0.3,
        centerTitle: true,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom:isPortrait==true? 10.sp: _size.height*0.05, right: 30.sp),
            child: Column(
              children: [
                Header(),
                Container(
                  child: appBarTitle,
                  color: AppCores.ghostwhite,
                  width:isPortrait==true? 200.sp: _size.width*0.4,
                  height:isPortrait==true? 30.sp: _size.height*0.09,
                )
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left:isPortrait==true? 20.sp: _size.width*0.2,
            top:isPortrait==true? 55.sp: _size.height*0.15,
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
                          hintText: "Pesquisar categoria",
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
      actionIcon = Icon(
        Icons.search,
        color: Colors.green,
      );
      appBarTitle = Text(
        "",
        style: TextStyle(color: Colors.black, fontSize: 20),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class Uiitem extends StatelessWidget {
  final Building i;
  Uiitem(this.i);

  Widget build(BuildContext context) {
    return ListButton(
      id: i.id,
      texto: i.name,
      imagem: i.image,
    );
  }
}
