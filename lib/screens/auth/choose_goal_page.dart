import 'package:ehub/core/components/icons_name.dart';
import 'package:ehub/screens/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';
import '../../widgets/main_bottomsheet.dart';
import 'arias_page.dart';

class ChooseGoalPage extends StatelessWidget {
  const ChooseGoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: mainAppbar(context, isBack: true),
        body: Padding(
          padding: EdgeInsets.only(
              left: 16.w, right: 16.w, top: 30.h, bottom: 130.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Text("Выберите свою цель:",
                      style: Theme.of(context).textTheme.headline6),
                ),
                Text(
                  "Шаг 1 / 3",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.kWhite,
                      fontWeight: FontWeight.w400),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  side: BorderSide(
                                      color: AppColor.kWhite.withOpacity(0.7))),
                              minimumSize: Size(343.w, 80.h)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AriasPage())));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Изучение языка",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text("Изучать иностранные языки",
                                      style: TextStyle(
                                          color: AppColor.kWhite,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              SvgPicture.asset(AppIcons.eWhite),
                            ],
                          )),
                    );
                  },
                  itemCount: 12,
                )
              ],
            ),
          ),
        ),
        bottomSheet: mainBottomsheet(context, navigatorPage: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        }),
      ),
    );
  }
}
