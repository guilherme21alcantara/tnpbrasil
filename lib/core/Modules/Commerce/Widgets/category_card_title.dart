import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';

class CategoryCardTitle extends StatefulWidget {
  final String title;
  const CategoryCardTitle({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryCardTitleState createState() => _CategoryCardTitleState();
}

class _CategoryCardTitleState extends State<CategoryCardTitle> {
  final CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height:isPortrait==true? 20.sp: 13.sp,
      width: 140.sp,
      decoration: BoxDecoration(
          color: AppCores.mainGreen, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
           widget.title,
          style: TextStyle(
              color: AppCores.ghostwhite,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
        ),
        
      ),
    );
  }
}
