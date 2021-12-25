import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
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
    final vm = ref.watch(currentWeatherProvider);
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
      // final String formattedDateTime = _formatDateTime(now);
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

    // ref.listen<RequestState>(currentWeatherProvider, (T, value) {
    //   if (value is Error) {
    //     return AppSnackBar.showErrorSnackBar(context,
    //         message: value.error.toString());
    //   }
    // });

    return Container(
        // padding: EdgeInsets.only(top: 10.w),
        // height: 300,
        // width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //     color: const Color(0xffffffff).withOpacity(0.11),
        //     border: Border.all(
        //       width: 2,
        //       color: const Color(0xffffffff).withOpacity(0.5),
        //     ),
        //     borderRadius: BorderRadius.circular(10.r)),
        child: vm.when(
      error: (Object error, StackTrace stackTrace) {
        return const Center(
          child: Text(
            "     City not Found\n"
            "Please search correctly",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      idle: () {
        return const Center(child: CircularProgressIndicator());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      success: (value) {
        String tempDisplay() {
          var timeNow = DateTime.now().hour;

          if (timeNow <= 12) {
            return (dynamic temp) {
              final celcius = (temp / 10).toStringAsFixed(1);
              return celcius.toString();
            }(
              value!.list![0].temp!.morn,
            );
          } else if ((timeNow > 12) && (timeNow <= 16)) {
            return (dynamic temp) {
              final celcius = (temp / 10).toStringAsFixed(1);
              return celcius.toString();
            }(
              value!.list![0].temp!.day,
            );
          } else if ((timeNow > 16) && (timeNow < 20)) {
            return (dynamic temp) {
              final celcius = (temp / 10).toStringAsFixed(1);
              return celcius.toString();
            }(
              value!.list![0].temp!.eve,
            );
          } else {
            return (dynamic temp) {
              final celcius = (temp / 10).toStringAsFixed(1);
              return celcius.toString();
            }(
              value!.list![0].temp!.night,
            );
          }
        }

        String fahreheitDisplay() {
          var timeNow = DateTime.now().hour;

          if (timeNow <= 12) {
            return (dynamic temp) {
              var celcius = (temp / 10);
              var fah = ((9 * celcius) / 5 + 32).toStringAsFixed(0);

              return '${fah.toString()}${"\u2109"}';
            }(
              value!.list![0].temp!.day,
            );
          } else if ((timeNow > 12) && (timeNow <= 16)) {
            return (dynamic temp) {
              var celcius = (temp / 10);
              var fah = ((9 * celcius) / 5 + 32).toStringAsFixed(0);

              return '${fah.toString()}${"\u2109"}';
            }(
              value!.list![0].temp!.eve,
            );
          } else if ((timeNow > 16) && (timeNow < 20)) {
            return (dynamic temp) {
              var celcius = (temp / 10);
              var fah = ((9 * celcius) / 5 + 32).toStringAsFixed(0);

              return '${fah.toString()}${"\u2109"}';
            }(
              value!.list![0].temp!.eve,
            );
          } else {
            return (dynamic temp) {
              var celcius = (temp / 10);
              var fah = ((9 * celcius) / 5 + 32).toStringAsFixed(0);

              return '${fah.toString()}${"\u2109"}';
            }(
              value!.list![0].temp!.night,
            );
          }
        }

        // final String name = value!.city!.country!;
        // final countryName = name;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("http://openweathermap.org/img/wn/02d@2x.png"),
                const Gap(10),
                Column(
                  children: [
                    const Gap(20),
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${value!.city!.name.toString()}, "
                        " ${value.city!.country.toString()}  ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Gap(5),
            GestureDetector(
              onTap: () {
                ref.read(toggleStateProvider.notifier).state =
                    toggle == true ? false : true;
              },
              child: toggle == true
                  ? Text(
                      "${tempDisplay()}${"\u2103"}",
                      style: TextStyle(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  : Text(
                      fahreheitDisplay(),
                      style: TextStyle(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
            ),
            Text(
              "${value.city!.name.toString()}, "
              " ${value.city!.country.toString()}  "
              "${store.value}",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        );
      },
    ));
  }
}
