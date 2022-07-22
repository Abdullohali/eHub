import 'package:ehub/screens/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';

import '../../core/components/const.dart';
import '../../widgets/main_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColor.klinearGradient),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: mainAppbar(context, isBack: false),
        body: Center(
          child: Text(
            "Welcome to EHub",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.kLinear1,
          onPressed: () async {
            await Hive.box('user')
                .put('isActive', "")
                .then((value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpPage()),
                      (route) => false,
                    ));
          },
          child: const Icon(Icons.login_outlined),
        ),
      ),
    );
  }
}
