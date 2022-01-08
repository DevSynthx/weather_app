import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/widgets/weather_tab.dart';
import 'package:weather_app/vm/current_weather_data.dart';
import 'package:weather_app/vm/daily_weather_data.dart';
import 'package:weather_app/vm/hourly_weather_data_vm.dart';
import 'package:weather_app/vm/today_data.dart';
import 'widgets/background_view.dart';
import 'widgets/center_display_weather.dart';
import 'widgets/floating_search.dart';
import 'widgets/top_display.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(currentWeatherDataProvider);
                    ref.refresh(todayWeatherProvider);
                    ref.refresh(hourlyDataProvider);
                    ref.refresh(dailyDataProvider);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(40.h),
                        const GreetingText(),
                        Gap(40.h),
                        CenterWeatherDisplay(),
                        Gap(30.h),
                        const WeatherTab()
                      ],
                    ),
                  ),
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
