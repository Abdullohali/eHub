import 'package:ehub/core/components/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDecorations {
  static AnimatedContainer getBorderDecoration(
          {Color? color, double height = 60.0, int duration = 0}) =>
      AnimatedContainer(
          duration: Duration(milliseconds: duration),
          height: height.h,
          width: 6.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6.r),
              bottomRight: Radius.circular(6.r),
            ),
          ));
  static BoxDecoration decoWithShadow({double radius = 10.0}) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(
              color: AppColor.kGrey,
              offset: const Offset(0.0, 2.0),
              blurStyle: BlurStyle.solid,
              blurRadius: 1.0,
              spreadRadius: 0.5.r)
        ],
      );

  static BoxDecoration blueDecoration({
    Color bodyColor = AppColor.kLinear1,
    Color borderColor = AppColor.kBlue,
  }) {
    return BoxDecoration(
      color: bodyColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(4.r),
    );
  }
}
