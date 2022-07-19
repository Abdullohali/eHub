import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/components/const.dart';
import '../core/components/icons_name.dart';

AppBar mainAppbar(BuildContext context, {bool isBack = true}) {
  return AppBar(
    backgroundColor: AppColor.kBlue,
    elevation: 0,
    leading: isBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    title: Padding(
      padding: isBack ? EdgeInsets.only(left: 90.w) : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment:
            isBack ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AppIcons.eWhite,
            height: 20.h,
          ),
          SizedBox(width: 0.8.w),
          Text(
            'hub',
            style: TextStyle(color: AppColor.kWhite, fontSize: 25.h),
          ),
        ],
      ),
    ),
  );
}
