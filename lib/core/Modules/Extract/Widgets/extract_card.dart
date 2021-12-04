import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/Global/subtext.dart';

class ExtractCard extends StatefulWidget {
  final String title;
  final String date;

  final String type;
  final String value;
  const ExtractCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.type,
      required this.value})
      : super(key: key);

  @override
  _ExtractCardState createState() => _ExtractCardState();
}

class _ExtractCardState extends State<ExtractCard> {
  @override
  Widget build(BuildContext context) {

    
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
     Size _size = MediaQuery.of(context).size;
     
    return SizedBox(
        width: 80.sp,
     height:isPortrait==true? _size.height*0.19: _size.height*0.3,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:isPortrait==true? 5.sp: _size.width*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:isPortrait==true? 230.sp: _size.width*0.8,
                        child: AutoSizeText(
                          widget.title,
                          minFontSize: 16,
                          maxLines: 2,
                          style: TextStyle(
                              color: AppCores.darkbluecyan,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height:isPortrait==true? 0.5.h: _size.height*0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Subtext(text: widget.date, font: 8.sp),
                          SizedBox(
                            width: 10.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.sp,
                      ),
                      Subtext(text: widget.type, font: 8.sp),
                      SizedBox(
                        height: 3.sp,
                      ),
                      Subtext(text: widget.value, font: 8.sp),
                    ],
                  ),
                  // Icon(
                  //   Icons.info_outline,
                  //   size: 25.sp,
                  //   color: AppCores.mainGreen,
                  // )
                ],
              ),
            ),
            Divider(
              thickness: 1.sp,
              color: AppCores.darkgray,
            )
          ],
        ));
  }
}

