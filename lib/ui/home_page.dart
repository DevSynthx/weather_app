import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:weather_app/ui/widgets/daily_data_display.dart';
import 'package:weather_app/ui/widgets/device_location.dart';
import 'package:weather_app/ui/widgets/timer_view.dart';
import 'package:weather_app/ui/widgets/top_header.dart';
import 'package:weather_app/ui/widgets/weather_tab.dart';

import 'widgets/center_display_weather.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = useState('');
    final address = useState('search');
    final deviceLocation = useState('');

    useEffect(() {
      // getLocation();
      // getUserLocation();

      // getAddressFromLatLong();
      // location.value = formatted;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/nightfall.png'),
        //         fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.only(left: 35.w, right: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const TopHeader(),
              const Gap(10),
              // Container(
              //   height: 150.h,
              //   width: MediaQuery.of(context).size.width,
              //   color: Colors.white,
              // ),
              const GreetingText(),
              const Gap(10),
              const DeviceLocation(),
              const Gap(60),
              CenterWeatherDisplay(),
              const Gap(40),
              const WeatherTab()
              // const DailyWeather()
              // InkWell(
              //   onTap: () {
              //     showModalBottomSheet(
              //         context: context,
              //         builder: (context) {
              //           return Container();
              //         });
              //   },
              //   child: Container(
              //     height: 55,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //               color: Colors.grey.withOpacity(0.1),
              //               blurRadius: 2,
              //               spreadRadius: 2,
              //               offset: const Offset(2, 2))
              //         ],
              //         color: const Color(0xffffffff).withOpacity(0.10),
              //         borderRadius: BorderRadius.circular(10.r)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Forcast report',
              //           style: TextStyle(
              //               fontSize: 25.sp,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white),
              //         ),
              //         Gap(9.w),
              //         const Icon(
              //           Icons.expand_less_outlined,
              //           color: Colors.white,
              //         ),
              //       ],
              //     ),
              //   ),
              // )
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

      if (timeNow <= 4) {
        print(timeNow);
        return 'Good morning sir 🤨 \nwhy are you awake';
      } else if ((timeNow >= 5) && (timeNow <= 12)) {
        print(timeNow);
        return 'Good Morning David 😊';
      } else if ((timeNow > 12) && (timeNow <= 16)) {
        return 'Good Afternoon, David 😌';
      } else if ((timeNow > 16) && (timeNow < 20)) {
        return 'Good Evening 🙂';
      } else {
        return 'Good evening 🤨 \nwhy are you awake';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Text(
        greetingMessage(),
        style: TextStyle(
            fontSize: 23.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
