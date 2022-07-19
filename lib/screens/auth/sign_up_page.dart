import 'package:ehub/screens/auth/sms_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final String initialCountry = 'UZ';
  final PhoneNumber number =
      PhoneNumber(isoCode: 'UZ', dialCode: "+998", phoneNumber: "##-###-##-##");
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: mainAppbar(context, isBack: false),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Добро пожаловать в E-Hub!",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 264.h,
                width: 343.w,
                padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.kWhite),
                child: Column(
                  children: [
                    Text("Укажите номер телефона",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    SizedBox(height: 10.h),
                    Text(
                      "Вы получите СМС-код подтверждения на указанный номер",
                      style: TextStyle(color: AppColor.kGrey, fontSize: 13.h),
                      textAlign: TextAlign.center,
                    ),
                    phoneField(),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SmsConfirmationPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(293.w, 40.h),
                          primary: AppColor.kBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.r))),
                      child: Text(
                        "Вход / Регистрация",
                        style: TextStyle(color: AppColor.kWhite, fontSize: 13.h),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding phoneField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {},
        onInputValidated: (bool value) {},
        selectorConfig: const SelectorConfig(
          leadingPadding: 10,
          setSelectorButtonAsPrefixIcon: true,
          trailingSpace: false,
          selectorType: PhoneInputSelectorType.DIALOG,
        ),
        hintText: "99 999 99 99",
        ignoreBlank: false,
        textStyle: TextStyle(
            color: AppColor.kBlack,
            fontSize: 16.h,
            fontWeight: FontWeight.w500),
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: controller,
        formatInput: false,
        keyboardType: const TextInputType.numberWithOptions(),
      ),
    );
  }
}
