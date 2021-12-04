import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Modules/Category/Controller/category_controller.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  const CategoryCard({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  final CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: 20.sp,
      width: 140.sp,
      decoration: BoxDecoration(
          color: AppCores.mainGreen, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          controller.name_category ?? widget.title,
          style: TextStyle(
              color: AppCores.ghostwhite,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
        ),
        
      ),
    );
  }
}
