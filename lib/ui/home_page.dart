import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/widgets/weather_tab.dart';
import 'widgets/background_view.dart';
import 'widgets/center_display_weather.dart';
import 'widgets/floating_search.dart';
import 'widgets/greeting_text.dart';

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
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(bg()), fit: BoxFit.fill)),
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
