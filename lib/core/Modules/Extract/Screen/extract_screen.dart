import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_list.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Global/pt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnp/core/Data/Api/api_extract.dart';
import 'package:tnp/core/Modules/Extract/Widgets/extract_card.dart';

class Building {
  String? data, valor, historico, operacao, cod;
  Building({this.data, this.valor, this.historico, this.operacao, this.cod});
}

class ExtractScreen extends StatefulWidget {
  const ExtractScreen({Key? key}) : super(key: key);

  @override
  _ExtractScreenState createState() => _ExtractScreenState();
}

class _ExtractScreenState extends State<ExtractScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  final ext = ApiExtract();
  List<Building>? _list;
  List<Building> _extractList = [];
  @override
  void initState() {
    super.initState();
    init();
    //ext.postExtrato();
  }

  void init() async {
    var prefs = await SharedPreferences.getInstance();
    int? nome = (prefs.getInt("indexextract"));
    for (int index = 0; index < nome!;) {
      _list = List<Building>.generate(
          nome,
          (i) => Building(
                data: prefs.getString("date$i"),
                valor: prefs.getString("valor$i"),
                historico: prefs.getString("historico$i"),
                operacao: prefs.getString("operacao$i"),
                cod: prefs.getInt("cod$i").toString(),
              ));
      index++;
      setState(() {
        _extractList = _list!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(child: Stack(
      children: [
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(left: 15.sp),
          child: MainText(
            text: ExtractTexts.title,
            font: 16,
            color: AppCores.darkbluecyan,
          ),
        )),
        Padding(
            padding: EdgeInsets.only(top: 40.sp, left: 10.sp, right: 10.sp),
            child: ListView.builder(
              itemCount: _extractList.length,
              itemBuilder: (context, index) {
                return Uiitem(_extractList[index]);
              },
            ))
      ],
    ),onWillPop: ()async=>false,);
  }
}

class Uiitem extends StatelessWidget {
  final Building i;
  Uiitem(this.i);

  Widget build(BuildContext context) {
    return ExtractCard(
        title: i.historico!, date: i.data!, type: i.operacao!, value: i.valor!);
  }
}
