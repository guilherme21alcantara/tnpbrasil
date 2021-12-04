import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Routes/app_routes.dart';

class TransactionCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData iconData;
  final String goTo;
  const TransactionCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.iconData,
      required this.goTo})
      : super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      width: 250.sp,
      color: AppCores.pureWhite,
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp),
        child: Row(
          children: [
            Icon(
              widget.iconData,
              size: 20.sp,
              color: AppCores.mainGreen,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.sp, right: 10.sp),
              child: SizedBox(
                width: 150.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      widget.title,
                      maxLines: 2,
                      minFontSize: 8,
                      style: TextStyle(
                          color: AppCores.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    AutoSizeText(
                      widget.description,
                      maxLines: 3,
                      minFontSize: 8,
                      style: TextStyle(
                          color: AppCores.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                splashRadius: 1,
                onPressed: () {
                  Get.toNamed(widget.goTo);
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 25.sp,
                  color: AppCores.mainGreen,
                ))
          ],
        ),
      ),
    );
  }
}
