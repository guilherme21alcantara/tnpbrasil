//@dart=2.9
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';
import 'package:tnp/core/Modules/Purchase/Controller/purchase.dart';
import 'package:tnp/core/Modules/Purchase/Screen/purchase_screen.dart';

class RestaurantCardCity extends StatefulWidget {
  final String photo;
  final String name;
  final int id;
  final String urlcategory;
  final String cidadecategory;
  final String desconto;
  final int cod;
  //final String phone;
  //final bool isFavorite;
  const RestaurantCardCity({
    Key key,
     this.name,
    //  this.phone,
     this.photo,
     this.id,
     this.urlcategory,
     this.cidadecategory,
     this.desconto,
     this.cod
    //required this.isFavorite
  }) : super(key: key);

  @override
  _RestaurantCardCityState createState() => _RestaurantCardCityState();
}

class _RestaurantCardCityState extends State<RestaurantCardCity> {
  double value = 0;
  bool favorite = false;

  @override
  void initState() {
    //favorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    final PurchaseController purchase = Get.put(PurchaseController());

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.only(bottom: 5.sp, top: 10.sp),
      child: Container(
        height: 120.sp,
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(8.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.sp, top: 10.sp),
              child: SizedBox(
                  height: 55.sp,
                  width: 65.sp,
                  child: Image.network(
                    widget.photo == null ? controller.image : widget.photo,
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width:isPortrait==true? _size.width*0.65: _size.width*0.6,
                        height: 20.sp,
                        child: Text(
                          widget.name.capitalize,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              color: AppCores.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                      ),
                      /*IconButton(
                        onPressed: () {
                          setState(() {
                            favorite == false
                                ? favorite = true
                                : favorite = false;
                          });
                        },
                        splashRadius: 1,
                        icon: (favorite)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18.sp,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: AppCores.darkgray,
                                size: 18.sp,
                              )),*/
                    ],
                  ),
                  Column
                   (
                    children: [
                      SizedBox(height: _size.height*0.02,),
                      AutoSizeText(
                        'Beneficio: '+widget.desconto,
                        maxLines: 1,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppCores.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),SizedBox(height: 1,width: 2.sp,),

                      AutoSizeText(
                        widget.cidadecategory+'-'+widget.urlcategory,
                        maxLines: 1,
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppCores.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  /* Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: AppCores.mainGreen,
                        size: 14.sp,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      AutoSizeText(
                        widget.phone,
                        maxLines: 1,
                        minFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppCores.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),*/
                  Row(
                    children: [
                      SizedBox(
                        width:isPortrait==true? 110.sp: _size.width*0.7,
                        height: 30.sp,
                      ),Container
                      (
                        height: _size.height*0.045,
                        child: 
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppCores.mainGreen),
                            maximumSize: MaterialStateProperty.all<Size>(
                                Size(75.sp, 24.sp)),
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(75.sp, 24.sp)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PurchaseScreen()),
                            );
                            purchase.cod = widget.cod;
                            purchase.title = widget.name;
                            purchase.image = widget.photo;
                            purchase.urlcategory = widget.urlcategory ;
                            purchase.cidadecategory = widget.cidadecategory+'-'+widget.urlcategory;
                            purchase.desconto = widget.desconto;
                            print(purchase.desconto);
                          },
                          child: Center(
                            child: Text(
                              "Pagar",
                              style: TextStyle(
                                  color: AppCores.black, fontSize: 12.sp),
                            ),
                          )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
