import 'package:ehub/allCubit/bottobmar_cubit.dart';
import 'package:ehub/core/components/const.dart';
import 'package:ehub/screens/splashScreen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'allCubit/auth_cubit.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<BottombarCubit>(
          create: (context) => BottombarCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox('user');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primaryColor: AppColor.kWhite,
            fontFamily: 'Inter',
            textTheme: TextTheme(
              headline6: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  fontWeight: FontWeight.bold,
                  color: AppColor.kWhite),
              bodyText1: TextStyle(
                  fontSize: ScreenUtil().setSp(16), color: AppColor.kWhite),
              bodyText2: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: AppColor.kBlack,
                  fontWeight: FontWeight.bold),
              button: TextStyle(
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),

          home: const SplashScreenPage(),
        );
      },
    );
  }
}
