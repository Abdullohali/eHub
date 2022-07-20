import 'package:ehub/allCubit/cubit/cubit/arias_cubit.dart';
import 'package:ehub/screens/auth/choose_city_page.dart';
import 'package:ehub/screens/auth/choose_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/components/const.dart';
import '../../core/components/icons_name.dart';
import '../../widgets/main_appbar.dart';
import '../../widgets/main_bottomsheet.dart';

class AriasPage extends StatelessWidget {
  const AriasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AriasCubit(),
      child: BlocBuilder<AriasCubit, AriasState>(
        builder: (context, state) {
          AriasCubit cubit = context.watch<AriasCubit>();
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
                        child: Text("Выберите какие занятия вас интересуют:",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Text(
                        "Шаг 2 / 3",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColor.kWhite,
                            fontWeight: FontWeight.w400),
                      ),
                      Wrap(
                        children: [
                          ...List.generate(
                              65,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<AriasCubit>().changeValue(index);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: cubit.indexList[index]
                                            ? AppColor.kWhite.withOpacity(0.7)
                                            : AppColor.kWhite,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.h),
                                        child: Text(
                                          "Английский",
                                          style: TextStyle(
                                              color: cubit.indexList[index]
                                                  ? AppColor.kWhite
                                                  : AppColor.kLinear1,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ),
                                  ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              bottomSheet: mainBottomsheet(context, navigatorPage: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChooseHomePage()));
              }),
            ),
          );
        },
      ),
    );
  }
}
