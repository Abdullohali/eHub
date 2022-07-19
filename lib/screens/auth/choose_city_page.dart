import 'package:ehub/screens/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class ChooseCityPage extends StatelessWidget {
  const ChooseCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlue,
      appBar: mainAppbar(context, isBack: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text("Ваш город",
                    style: Theme.of(context).textTheme.headline6),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    title: Text("Москва",
                        style: Theme.of(context).textTheme.bodyText1),
                    contentPadding: EdgeInsets.zero,
                    shape: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: AppColor.kWhite.withOpacity(0.7))),
                  );
                },
                itemCount: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
