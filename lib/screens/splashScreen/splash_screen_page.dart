import 'dart:async';

import 'package:ehub/core/components/const.dart';
import 'package:ehub/core/components/icons_name.dart';
import 'package:ehub/screens/auth/sign_up_page.dart';
import 'package:ehub/screens/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool isAvtive = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => isAvtive ? HomeScreen() : SignUpPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AppIcons.eWhite,
            color: AppColor.kBlue,
            height: 26.h,
          ),
          SizedBox(width: 0.8.w),
          Text(
            'hub',
            style: TextStyle(
                color: AppColor.kBlack,
                fontSize: 34.h,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
