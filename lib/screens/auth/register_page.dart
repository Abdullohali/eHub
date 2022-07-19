import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlue,
      appBar: mainAppbar(context, isBack: true),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Регистрация",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 343.h,
              width: 343.w,
              padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColor.kWhite),
              child: Column(
                children: [
                  Text("Персональные данные",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center),
                  SizedBox(height: 10.h),
                  Text(
                    "Мы собираем личные данные в целях персонализации. Будем искать наиболееподходящие для вас предложения",
                    style: TextStyle(color: AppColor.kGrey, fontSize: 13.h),
                    textAlign: TextAlign.center,
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
