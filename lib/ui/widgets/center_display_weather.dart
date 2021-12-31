import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/ui/widgets/device_location.dart';
import 'package:weather_app/vm/current_weather_data.dart';
import 'package:weather_app/vm/current_weather_vm.dart';

class CenterWeatherDisplay extends HookConsumerWidget {
  CenterWeatherDisplay({
    Key? key,
  }) : super(key: key);

  final toggleStateProvider = StateProvider<bool>((ref) {
    return true;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(currentWeatherDataProvider);
    final toggle = ref.watch(toggleStateProvider);
    final store = useState('');

    // format date
    // String _formatDateTime(DateTime dateTime) {
    //   return DateFormat('hh:mm:ss').format(dateTime);
    // }

    var dateTimer = DateTime.now();
    String formatted = DateFormat('hh:mm:ss').format(dateTimer);

    void _getTime() {
      final DateTime now = DateTime.now();
      final String newTimer = now.toString();
      store.value = newTimer;
    }

    useEffect(() {
      store.value = formatted;
      final count = Timer.periodic(const Duration(seconds: 1), (time) {
        _getTime();
      });
      final String = count.toString();

      return count.cancel;
    });
    return vm.when(
      idle: () {
        return const Center(child: CircularProgressIndicator());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      },
      success: (data) {
        const String iconx = 'assets/images/01-s.png';
        const String iconxx = 'assets/images/02-s.png';
        const String icons = 'assets/images/03-s.png';
        String getIcons() {
          if (data![0].weatherText == "sunny") {
            return iconxx;
          }
          if (data[0].weatherText == "Mostly Sunny") {
            return iconx;
          }
          if (data[0].weatherText == "Partly Sunny") {
            return icons;
          } else {
            return iconx;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${data![0].temperature!.imperial!.value!.toInt()}\u00B0',
              style: TextStyle(
                fontSize: 100.sp,
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
                  data[0].weatherText.toString(),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const DeviceLocation(),
            Gap(35.h),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text(
                        '${data[0].wind!.speed!.metric!.value!.toString()} ${data[0].wind!.speed!.metric!.unit!.toString()}',
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
                        data[0].dewPoint!.imperial!.value!.toInt().toString(),
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
                        '${data[0].visibility!.metric!.value!.toString()} ${data[0].visibility!.metric!.unit!.toString()}',
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
                        data[0].indoorRelativeHumidity.toString(),
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
