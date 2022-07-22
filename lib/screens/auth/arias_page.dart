import 'package:ehub/allCubit/auth_cubit.dart';
import 'package:ehub/screens/auth/choose_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/const.dart';
import '../../models/cities_model.dart';
import '../../service/auth_service.dart';
import '../../widgets/main_appbar.dart';
import '../../widgets/main_bottomsheet.dart';

class AriasPage extends StatelessWidget {
  const AriasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit cubit = context.watch<AuthCubit>();
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
                    FutureBuilder(
                      future: EHubRegisterService().cityService(),
                      builder:
                          (context, AsyncSnapshot<List<Citiyes>?> snapshot) {
                        if (snapshot.hasData) {
                          var snap = snapshot.data![1];
                          return Wrap(
                            children: [
                              ...List.generate(
                                  snap.variants!.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (cubit.indexList[index]) {
                                              context
                                                  .read<AuthCubit>()
                                                  .variants
                                                  .add(
                                                    snap.variants![index].id,
                                                  );
                                            } else {
                                              context
                                                  .read<AuthCubit>()
                                                  .variants
                                                  .remove(
                                                    snap.variants![index].id,
                                                  );
                                            }
                                            context
                                                .read<AuthCubit>()
                                                .changeValueArias(index);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: cubit.indexList[index]
                                                ? AppColor.kWhite
                                                    .withOpacity(0.7)
                                                : AppColor.kWhite,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(3.h),
                                            child: Text(
                                              snap.variants![index].name
                                                  .toString(),
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
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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
    );
  }
}
