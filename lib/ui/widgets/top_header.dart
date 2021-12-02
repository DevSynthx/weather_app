import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45.h,
          width: 150.w,
          decoration: BoxDecoration(
              color: const Color(0xffffffff).withOpacity(0.10),
              borderRadius: BorderRadius.circular(30.r)),
          child: Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                Gap(9.w),
                Text(
                  'Lagos, Nigeria',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: const Color(0xffffffff).withOpacity(0.10),
              borderRadius: BorderRadius.circular(10.r)),
          child: const Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
