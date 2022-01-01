import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/ui/widgets/weather%20Tabs/daily_data_display.dart';
import 'package:weather_app/ui/widgets/weather%20Tabs/hourly_data_display.dart';

import 'weather Tabs/today_data_display.dart';

class WeatherTab extends HookConsumerWidget {
  const WeatherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tabController = useTabController(initialLength: 3);

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 21.w, right: 18.w),
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  isScrollable: false,
                  controller: _tabController,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  unselectedLabelColor: Colors.grey[100],
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: Colors.lightBlueAccent,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Daily',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Hourly',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300.h,
                // color: Colors.grey,
                child: TabBarView(controller: _tabController, children: const [
                  TodayWeather(),
                  DailyWeather(),
                  HourlyWeather()

                  // AllView(),
                  // InflowView(),
                  // OutflowView(),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
