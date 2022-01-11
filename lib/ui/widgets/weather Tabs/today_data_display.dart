import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/vm/hourly_weather_data_vm.dart';
import 'package:weather_app/vm/today_data.dart';

import '../loading_progress.dart';

class TodayWeather extends ConsumerStatefulWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  TodayWeatherState createState() => TodayWeatherState();
}

class TodayWeatherState extends ConsumerState<TodayWeather>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = ref.watch(todayWeatherProvider);

    return vm.when(
      idle: () => const LoadingProgress(),
      loading: () => const LoadingProgress(),
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      },
      success: (data) {
        const String iconx = 'assets/images/02-s.png';
        const String iconxx = 'assets/images/33-s.png';
        const String icons = 'assets/images/18-s.png';
        const String rainIcons = 'assets/images/12-s.png';
        const String intermitIcons = 'assets/images/04-s.png';
        return SizedBox(
          height: 400.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              // scrollDirection: Axis.horizontal,
              itemCount: data!.dailyForecasts!.length,
              itemBuilder: (context, index) {
                final today = data.dailyForecasts![index];
                String getIcons() {
                  if (today.day!.iconPhrase == "Mostly sunny") {
                    return iconx;
                  }
                  if (today.day!.iconPhrase == "Mostly clear") {
                    return iconxx;
                  }
                  if (today.day!.iconPhrase == "Partly sunny") {
                    return icons;
                  }
                  if (today.day!.iconPhrase == "Intermittent clouds") {
                    return intermitIcons;
                  }
                  if (today.day!.iconPhrase == "Mostly cloudy") {
                    return icons;
                  }
                  if (today.day!.iconPhrase == "Showers") {
                    return rainIcons;
                  } else {
                    return iconx;
                  }
                }

                String getNightIcons() {
                  if (today.night!.iconPhrase == "Mostly sunny") {
                    return iconx;
                  }
                  if (today.night!.iconPhrase == "Mostly clear") {
                    return iconxx;
                  }
                  if (today.night!.iconPhrase == "Partly Sunny") {
                    return icons;
                  }
                  if (today.night!.iconPhrase == "Intermittent clouds") {
                    return intermitIcons;
                  }
                  if (today.night!.iconPhrase == "Mostly cloudy") {
                    return icons;
                  }
                  if (today.night!.iconPhrase == "Showers") {
                    return rainIcons;
                  } else {
                    return iconx;
                  }
                }

                DateTime date = today.date!;
                final time = DateFormat.jm().format(date);

                return Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    children: [
                      GlassmorphicContainer(
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  getIcons(),
                                  // width: 100,
                                  // height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(20.h),
                                  Text(
                                    today.day!.iconPhrase.toString(),
                                    style: TextStyle(
                                        fontSize: 23.sp, color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rain probability:',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                      Gap(10.w),
                                      Text(
                                        today.day!.rainProbability.toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Cloud cover:',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                      Gap(10.w),
                                      Text(
                                        today.day!.cloudCover.toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        borderRadius: 10,
                        blur: 5,
                        border: 0,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            stops: const [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.5),
                            const Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                      ),
                      const Gap(20),
                      GlassmorphicContainer(
                        child: Center(
                          child: Row(
                            children: [
                              // Text(
                              //   time,
                              //   style:
                              //       TextStyle(fontSize: 15.sp, color: Colors.white),
                              // ),
                              SizedBox(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  getNightIcons(),
                                  // width: 100,
                                  // height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(20.h),
                                  Text(
                                    today.night!.iconPhrase.toString(),
                                    style: TextStyle(
                                        fontSize: 23.sp, color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rain probability:',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                      Gap(10.w),
                                      Text(
                                        today.night!.rainProbability.toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Cloud cover:',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                      Gap(10.w),
                                      Text(
                                        today.day!.cloudCover.toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        borderRadius: 10,
                        blur: 15,
                        border: 0,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.1),
                              const Color(0xFFFFFFFF).withOpacity(0.05),
                            ],
                            stops: const [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.5),
                            const Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
