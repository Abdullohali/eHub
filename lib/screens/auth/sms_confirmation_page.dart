import 'dart:async';

import 'package:ehub/screens/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../allCubit/auth_cubit.dart';
import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class SmsConfirmationPage extends StatefulWidget {
  const SmsConfirmationPage({Key? key}) : super(key: key);

  @override
  State<SmsConfirmationPage> createState() => _SmsConfirmationPageState();
}
  
class _SmsConfirmationPageState extends State<SmsConfirmationPage> {
  Timer? _timer;
  
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 0) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
          child: Scaffold( 
            backgroundColor: Colors.transparent,
            appBar: mainAppbar(context, isBack: true),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Подтвердите номер",
                    style: TextStyle(
                        color: AppColor.kWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 360.h,
                    width: 343.w,
                    padding:
                        EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColor.kWhite),
                    child: Column(
                      children: [
                        Text("Код подтверждения из СМС",
                            style: Theme.of(context).textTheme.bodyText2,
                            textAlign: TextAlign.center),
                        SizedBox(height: 10.h),
                        Text(
                          "Введите 4х значный код подтверждения из СМС",
                          style:
                              TextStyle(color: AppColor.kGrey, fontSize: 13.h),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                            },
                            child: Text(
                              "Ввести номер заново",
                              style: TextStyle(
                                  fontSize: 13.h, color: AppColor.kBlue),
                            )),
                        SizedBox(height: 20.h),
                        Pinput(
                          length: 4,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                            textStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(48),
                              color: AppColor.kBlack,
                            ),
                            height: 70.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.5, color: AppColor.kBlack)),
                            ),
                          ),
                          animationCurve: Curves.bounceIn,
                          controller: context.watch<AuthCubit>().smsController,
                          validator: (s) {
                            return s!.length == 4 ? null : 'Pin is incorrect';
                          },
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          onCompleted: (e) {
                            context.read<AuthCubit>().onSmsPressed(context);
                          },
                        ),
                        Container(
                          child: TextButton(
                              onPressed: () {
                                _start != 0
                                    ? null
                                    : context
                                        .read<AuthCubit>()
                                        .onSignUpPressed(context);
                                setState(() {
                                  _start = 60;
                                });
                              },
                              child: Text(
                                "Отправить повторный код",
                                style: TextStyle(
                                    fontSize: 13.h,
                                    color: _start != 0
                                        ? AppColor.kGrey
                                        : AppColor.kBlue),
                              )),
                        ),
                        Text(
                          "Доступно через $_start",
                          style: TextStyle(
                              fontSize: 11.h, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
