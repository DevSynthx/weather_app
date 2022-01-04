import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/vm/search_location_vm.dart';
import 'package:weather_app/vm/weather_by_location_vm.dart';

class SearchPage extends HookConsumerWidget {
  final String cityName;
  const SearchPage({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(weatherByLocationProvider(cityName));

    return SizedBox(
      child: Column(
        children: [
          vm.when(
            loading: () {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CircularProgressIndicator(),
                ),
              );
            },
            error: (Object error, StackTrace? stackTrace) {
              return Text(error.toString());
            },
            data: (data) {
              StorageUtil.setString(Constant.searchKey, data[0].key);

              return Padding(
                padding: EdgeInsets.only(left: 23.w, right: 23.w),
                child: Column(
                  children: [
                    Gap(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey[100],
                        ),
                        Gap(10.w),
                        Text(
                          '${data[0].localizedName.toString()},',
                          style: TextStyle(
                              color: Colors.grey[100], fontSize: 20.sp),
                        ),
                        Gap(8.w),
                        Text(
                          data[0].administrativeArea!.localizedName.toString(),
                          style: TextStyle(
                              color: Colors.grey[100], fontSize: 20.sp),
                        ),
                      ],
                    ),
                    const WeatherBuild()
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class WeatherBuild extends HookConsumerWidget {
  const WeatherBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(searchWeatherDataProvider);
    return vm.when(
      idle: () {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: CircularProgressIndicator(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (Object error, StackTrace? stackTrace) {
        return Text(error.toString());
      },
      success: (value) {
        const String iconx = 'assets/images/01-s.png';
        const String iconxx = 'assets/images/02-s.png';
        const String icons = 'assets/images/03-s.png';
        const String mostlyIcon = 'assets/images/06-s.png';
        const String clearIcon = 'assets/images/33-s.png';
        String getIcons() {
          if (value![0].weatherText == "sunny") {
            return iconxx;
          }
          if (value[0].weatherText == "Mostly Sunny") {
            return iconx;
          }
          if (value[0].weatherText == "Partly Sunny") {
            return icons;
          }

          if (value[0].weatherText == "Clear") {
            return clearIcon;
          }
          if (value[0].weatherText == "Mostly cloudy") {
            return mostlyIcon;
          } else {
            return iconx;
          }
        }

        return Column(
          children: [
            Gap(40.h),
            Text(
              '${value![0].temperature!.metric!.value!.toInt()}\u00B0',
              style: TextStyle(
                fontSize: 110.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getIcons(),
                  width: 50,
                  height: 50,
                ),
                Text(
                  value[0].weatherText.toString(),
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Gap(30.h),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text(
                        '${value[0].wind!.speed!.metric!.value!.toString()} ${value[0].wind!.speed!.metric!.unit!.toString()}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        'Wind',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  VerticalDivider(
                    color: Colors.grey[200],
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        value[0].dewPoint!.imperial!.value!.toInt().toString(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        'Dew Point',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  VerticalDivider(
                    color: Colors.grey[200],
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        '${value[0].visibility!.metric!.value!.toString()} ${value[0].visibility!.metric!.unit!.toString()}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        'Visibility',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  VerticalDivider(
                    color: Colors.grey[200],
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        value[0].indoorRelativeHumidity.toString(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        'Humidity',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
