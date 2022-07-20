import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      ),
    );
  }
}
