import 'package:ehub/core/components/const.dart';
import 'package:ehub/core/components/icons_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onPressed;

  const AppBottomNavBar({
    Key? key,
    required this.onPressed,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  void initState() {
    super.initState();
    // Hive.box('parentImage').clear(); Bazi Hivelarini clear qilish uchun joy chiqib ketganda tozalanadiganlarni
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),  
        ),
        color: AppColor.kWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _setItem(AppIcons.home, 'Главная', 0),
          _setItem(AppIcons.education, 'Мои курсы', 1),
          _setItem(AppIcons.user, 'Профиль', 2),
          _setItem(AppIcons.qr, 'Сканировать', 3),
        ],
      ),
    );
  }

  GestureDetector _setItem(String assetIcon, String label, int index) =>
      GestureDetector(
        onTap: () {
          widget.onPressed.call(index);
        },
        child: Column(
          children: [
            
            SizedBox(height: 6.h),
            SvgPicture.asset(assetIcon,
                height: 35.h,
                width: 35.w,
                color: index == widget.currentIndex
                    ? AppColor.kBlue
                    : AppColor.kGrey),
            SizedBox(height: 7.h),
            Text(
              label,
              style: TextStyle(
                  fontSize: index == widget.currentIndex ? 12.0 : 10.5,
                  color: index == widget.currentIndex
                      ? AppColor.kBlue
                      : AppColor.kGrey),
            ),
          ],
        ),
      );
}
