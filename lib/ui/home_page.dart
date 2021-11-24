import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/ui/color/value.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 23.w, right: 23.w),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                  Gap(20.w),
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(15.r)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
