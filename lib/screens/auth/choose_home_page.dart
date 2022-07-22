import 'package:ehub/allCubit/auth_cubit.dart';
import 'package:ehub/screens/auth/arias_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';
import '../../widgets/main_bottomsheet.dart';

class ChooseHomePage extends StatelessWidget {
  const ChooseHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
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
                        "Шаг 3 / 3",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColor.kWhite,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Домашний адрес",
                        style:
                            TextStyle(color: AppColor.kWhite, fontSize: 13.sp),
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.kWhite,
                            minimumSize: Size(163.w, 36.h)),
                        onPressed: () {},
                        child: const Text(
                          "Добавить",
                          style: TextStyle(color: AppColor.kBlue, fontSize: 13),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Рабочий или адрес учебы",
                        style:
                            TextStyle(color: AppColor.kWhite, fontSize: 13.sp),
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.kWhite,
                            minimumSize: Size(163.w, 36.h)),
                        onPressed: () {},
                        child: const Text(
                          "Добавить",
                          style: TextStyle(color: AppColor.kBlue, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
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
                          primary: AppColor.kWhite,
                          minimumSize: Size(343.w, 40.h)),
                      onPressed: () {
                        context.read<AuthCubit>().onRegisterPressed(context);
                      },
                      child: Text('gotova',
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
              )),
        );
      },
    );
  }
}
