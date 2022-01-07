import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/vm/hourly_weather_data_vm.dart';

import '../loading_progress.dart';

class HourlyWeather extends ConsumerStatefulWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  HourlyWeatherState createState() => HourlyWeatherState();
}

class HourlyWeatherState extends ConsumerState<HourlyWeather>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final vm = ref.watch(hourlyDataProvider);

    return vm.when(
      idle: () => const LoadingProgress(),
      loading: () => const LoadingProgress(),
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      },
      success: (data) {
        const String iconx = 'assets/images/04-s.png';
        const String iconxx = 'assets/images/12-s.png';
        const String icons = 'assets/images/18-s.png';
        const String weatherIcon1 = 'assets/images/02-s.png';
        const String weatherIcon2 = 'assets/images/33-s.png';
        return SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              // scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final hourly = data[index];
                String getIcons() {
                  if (hourly.weatherIcon == 12) {
                    return iconxx;
                  }
                  if (hourly.weatherIcon == 4) {
                    return iconx;
                  }
                  if (hourly.weatherIcon == 18) {
                    return icons;
                  }
                  if (hourly.weatherIcon == 2) {
                    return weatherIcon1;
                  }
                  if (hourly.weatherIcon == 34) {
                    return weatherIcon2;
                  } else {
                    return iconx;
                  }
                }

                DateTime date = hourly.dateTime!;
                final time = DateFormat.jm().format(date);

                return Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: GlassmorphicContainer(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            time,
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          ),
                          Image.asset(
                            getIcons(),
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            '${hourly.temperature!.value.toString()}\u00B0',
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    width: 100,
                    height: 50,
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
