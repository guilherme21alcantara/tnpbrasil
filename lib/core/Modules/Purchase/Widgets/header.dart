import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';

class PurchaseHeader extends StatefulWidget {
  final String name;
  final String description;
  final String urlcategory;
  final String cidadecategory;
  final String desconto;
  const PurchaseHeader({
    Key? key,
    required this.name,
    required this.description,
    required this.urlcategory,
    required this.cidadecategory,
    required this.desconto
  }) : super(key: key);

  @override
  _PurchaseHeaderState createState() => _PurchaseHeaderState();
}

class _PurchaseHeaderState extends State<PurchaseHeader> {
  @override
  Widget build(BuildContext context) {
    final PurchaseController purchase = Get.put(PurchaseController());
    
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height:isPortrait==true? _size.height*0.15: _size.height*0.25,
      width: 275.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 75.sp,
              width: 100.sp,
              child: Image.network(
                purchase.image,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: EdgeInsets.only(left: 5.sp, top: 10.sp),
            child: SizedBox(
              width: 170.sp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.name,
                    maxLines: 2,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppCores.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  AutoSizeText(
                    widget.cidadecategory,
                    maxLines: 4,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppCores.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  AutoSizeText(
                    widget.urlcategory,
                    maxLines: 4,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppCores.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  AutoSizeText(
                    widget.desconto,
                    maxLines: 4,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppCores.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
