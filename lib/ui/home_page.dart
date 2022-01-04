import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/widgets/weather_tab.dart';
import 'widgets/center_display_weather.dart';
import 'widgets/floating_search.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(110.h),

                    // const TopHeader(),

                    const GreetingText(),
                    Gap(10.h),
                    // const DeviceLocation(),
                    Gap(20.h),
                    CenterWeatherDisplay(),
                    Gap(30.h),
                    const WeatherTab()
                  ],
                ),
              ),
              const SearchBar(),
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
      print(timeNow);

      if (timeNow <= 4) {
        print(timeNow);
        return 'Good morning sir 🤨 \nwhy are you awake';
      } else if ((timeNow >= 5) && (timeNow <= 12)) {
        print(timeNow);
        return 'Good Morning David 😊';
      } else if ((timeNow > 12) && (timeNow <= 16)) {
        return 'Good Afternoon, David 😌';
      } else if ((timeNow > 16) && (timeNow < 23)) {
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
