import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/widgets/timer_view.dart';
import 'package:weather_app/ui/widgets/top_header.dart';

import 'widgets/center_display_weather.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 35, left: 25.w, right: 25.w),
        child: SafeArea(
          child: Column(
            children: [
              const TopHeader(),
              const Gap(80),
              const GreetingText(),
              const Gap(50),
              CenterWeatherDisplay(),
              // const Gap(30),
              // MyHomePage(),
              const Gap(100),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container();
                      });
                },
                child: Container(
                  height: 55,
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(2, 2))
                      ],
                      color: const Color(0xffffffff).withOpacity(0.10),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forcast report',
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Gap(9.w),
                      const Icon(
                        Icons.expand_less_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingText extends StatelessWidget {
  const GreetingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String greetingMessage() {
      var timeNow = DateTime.now().hour;

      if (timeNow <= 12) {
        print(timeNow);
        return 'Good Morning David 😊';
      } else if ((timeNow > 12) && (timeNow <= 16)) {
        return 'Good Afternoon 😌';
      } else if ((timeNow > 16) && (timeNow < 20)) {
        return 'Good Evening 🙂';
      } else {
        return 'Good evening 🤨 \nwhy are you awake';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 90),
      child: Text(
        greetingMessage(),
        style: TextStyle(
            fontSize: 23.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
