import 'package:ehub/allCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/components/const.dart';
import '../screens/auth/register_page.dart';

mainBottomsheet(BuildContext context,
    {Function? navigatorPage, String? buttonTitle}) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      return Container(
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.kLinear2,
              AppColor.kLinear1.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: AppColor.kWhite, minimumSize: Size(343.w, 40.h)),
              onPressed: () {
                navigatorPage!();
              },
              child: Text(buttonTitle ?? "Далее",
                  style: TextStyle(
                      color: AppColor.kBlue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Пропустить",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      );
    },
  );
}
