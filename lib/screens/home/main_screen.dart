import 'package:ehub/allCubit/cubit/bottobmar_cubit.dart';
import 'package:ehub/core/components/const.dart';
import 'package:ehub/screens/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottombarCubit(),
      child: BlocBuilder<BottombarCubit, BottobmarState>(
        builder: (ctx, state) {
          BottombarCubit cubit = ctx.watch();
          return Scaffold(
            backgroundColor: AppColor.kLinear2,
            body: _showBody(cubit.currentPageIndex, cubit.onBottomBarChanged),
            bottomNavigationBar: AppBottomNavBar(
                currentIndex: cubit.currentPageIndex,
                onPressed: cubit.onBottomBarChanged),
          );
        },
      ),
    );
  }

  Widget _showBody(int index, final onpressed) {
    switch (index) {
      case 0:
        return const MainPage();
      case 1:
        return const MainPage();
      case 2:
        return const MainPage();
      default:
        return const MainPage();
    }
  }
}
