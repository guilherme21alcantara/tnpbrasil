import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class MainList extends StatefulWidget {
  final List<Widget> conteudo;
  const MainList({Key? key, required this.conteudo}) : super(key: key);

  @override
  _MainListState createState() => _MainListState();
}

// ignore: camel_case_types
class _MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.conteudo.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: widget.conteudo[index],
        );
      },
    );
  }
}
