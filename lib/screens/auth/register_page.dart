import 'package:ehub/screens/auth/choose_goal_page.dart';
import 'package:ehub/screens/auth/sms_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: mainAppbar(context, isBack: true),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Регистрация",
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
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        miniTextField(hintText: "Имя", labelText: "Ваше имя"),
                        miniTextField(
                            hintText: "Фамилия", labelText: "Ваша фамилия")
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        miniDropDownButton(),
                        miniTextField(
                            labelText: "Дата рождения",
                            hintText: "ДД / ММ / ГГГГ"),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseGoalPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(293.w, 40.h),
                          primary: AppColor.kBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.r))),
                      child: Text(
                        "Подтвердить",
                        style:
                            TextStyle(color: AppColor.kWhite, fontSize: 13.h),
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

  Expanded miniDropDownButton() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ваш пол",
              style: TextStyle(fontSize: 12.h, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: 7.h),
          Container(
              height: 40.h,
              width: 140.h,
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: AppColor.kGrey),
                  color: AppColor.kWhite),
              child: DropdownButton<String>(
                underline: const Center(),
                icon: Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: const Icon(Icons.arrow_drop_down,
                        color: AppColor.kBlue)),
                style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kBlack),
                value: "Мужской",
                items: const [
                  DropdownMenuItem(
                    child: Text("Мужской"),
                    value: "Мужской",
                  ),
                  DropdownMenuItem(
                    child: Text("Женский"),
                    value: "Женский",
                  ),
                ],
                onChanged: (value) {},
              ))
        ],
      ),
    );
  }

  Expanded miniTextField({String? hintText, String? labelText}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText ?? "",
              style: TextStyle(fontSize: 12.h, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: 7.h),
          Container(
            height: 40.h,
            width: 140.h,
            padding: EdgeInsets.only(bottom: 7.h, left: 5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(color: AppColor.kGrey),
                color: AppColor.kWhite),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? "",
                hintStyle: TextStyle(fontSize: 12.h, color: AppColor.kGrey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
