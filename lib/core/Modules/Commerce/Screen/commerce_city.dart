import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp/core/Modules/Commerce/Widgets/list.dart';

class SearchCommerceCity extends StatefulWidget {
  const SearchCommerceCity({Key? key}) : super(key: key);

  @override
  _CommerceScreenState createState() => _CommerceScreenState();
}

class _CommerceScreenState extends State<SearchCommerceCity> {
  @override
  Widget build(BuildContext context) {
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
    return Scaffold(
      body: Stack(
        children: [
          SearchCommerceCity(),
        ],
      ),
    );
  }
}
