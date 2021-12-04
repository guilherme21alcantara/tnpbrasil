import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/main_text.dart';
import 'package:tnp/core/Data/Models/quotas.dart';
import 'package:tnp/core/Modules/Quotas/Controller/quotas_controller.dart';

class QuotasSlider extends StatefulWidget {
  final String availableQuotas;
  final String maxQuotas;

  const QuotasSlider(
      {Key? key, required this.availableQuotas, required this.maxQuotas})
      : super(key: key);

  @override
  _QuotasSliderState createState() => _QuotasSliderState();
}

class _QuotasSliderState extends State<QuotasSlider> {
  @override
  Widget build(BuildContext context) {
    final QuotasController controller = Get.put(QuotasController());
    String quotas = controller.current.replaceAll(".", '');
    int total = int.parse(widget.maxQuotas)-int.parse(widget.availableQuotas); 
    return Column(
      children: [
        Text(
          '$quotas de ${widget.maxQuotas}',
          style: TextStyle(
              color: AppCores.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              trackHeight: 4.sp,
              thumbColor: Colors.transparent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Slider(
              activeColor: AppCores.mainGreen,
              inactiveColor: AppCores.gray90,
              value: double.parse(widget.availableQuotas),
              min: 0,
              max: double.parse(widget.maxQuotas),
              onChanged: (double value) 
              {
              },
            ),
          ),
        ),
        // Text(
        //   'Quotas Restantes $total',
        //   style: TextStyle(
        //       color: AppCores.black,
        //       fontSize: 14.sp,
        //       fontWeight: FontWeight.w500),
        // ),
      ],
    );
  }
}
