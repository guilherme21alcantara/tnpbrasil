import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';

class TextBox extends StatefulWidget {
  final String title;
  final String value;
  final TextEditingController controller;
  const TextBox({Key? key, required this.title, required this.value, required this.controller})
      : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding:
          EdgeInsets.only(left: 15.sp, top: 2.sp, right: 10.sp, bottom: 2.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.sp),
            child: Text(
              widget.title,
              style: TextStyle(color: AppCores.darkerGray, fontSize: 14.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.sp),
            width:isPortrait==true?  230.sp: _size.width*0.9,
            height: 35.sp,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                border: Border.all(color: AppCores.darkgray),
                borderRadius: BorderRadius.circular(2)),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: widget.controller,
                  readOnly: false,
                  keyboardType: TextInputType.name,
                  onChanged: (v) 
                  {
                    print("object");
                  },
                  //initialValue: widget.value,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: AppCores.darkerGray, fontSize: 14.sp),
                      hintText: widget.value,
                      border: InputBorder.none),
                )),
          ),
        ],
      ),
    );
  }
}
