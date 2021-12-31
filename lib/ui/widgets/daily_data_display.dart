import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/vm/daily_weather_data.dart';

class DailyWeather extends ConsumerStatefulWidget {
  const DailyWeather({Key? key}) : super(key: key);

  @override
  DailyWeatherState createState() => DailyWeatherState();
}

class DailyWeatherState extends ConsumerState<DailyWeather>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(dailyDataProvider);

    return vm.when(
      idle: () {
        return const Center(child: Text('Loading loaction'));
      },
      loading: () {
        return const Center(child: Text('Loading loaction'));
      },
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
      },
      success: (data) {
        const String iconx = 'assets/images/04-s.png';
        const String iconxx = 'assets/images/12-s.png';
        const String icons = 'assets/images/18-s.png';
        return SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              // scrollDirection: Axis.horizontal,
              itemCount: data!.dailyForecasts!.length,
              itemBuilder: (context, index) {
                final daily = data.dailyForecasts![index];
                String getIcons() {
                  if (daily.day!.icon == 12) {
                    return iconxx;
                  }
                  if (daily.day!.icon == 4) {
                    return iconx;
                  }
                  if (daily.day!.icon == 18) {
                    return icons;
                  } else {
                    return iconx;
                  }
                }

                DateTime date = daily.date!;
                final weatherDate = DateFormat('EEE,MMM,yy').format(date);
                print(weatherDate);
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
                            weatherDate,
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          ),
                          Image.asset(
                            getIcons(),
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            '${daily.temperature!.minimum!.value.toString()}\u00B0 / ${daily.temperature!.maximum!.value.toString()}\u00B0',
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    width: 100,
                    height: 50,
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
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
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







// class DailyWeather extends HookConsumerWidget {
//   const DailyWeather({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final vm = ref.watch(dailyDataProvider);
//     final iconx = useState('assets/images/04-s.png');
//     final iconxx = useState('assets/images/12-s.png');
//     final icons = useState('assets/images/18-s.png');
//     return vm.when(
//       idle: () {
//         return const Center(child: Text('Loading loaction'));
//       },
//       loading: () {
//         return const Center(child: Text('Loading loaction'));
//       },
//       error: (Object error, StackTrace stackTrace) {
//         return Center(child: Text(error.toString()));
//       },
//       success: (data) {
//         return SizedBox(
//           height: 400,
//           width: MediaQuery.of(context).size.width,
//           child: ListView.builder(
//               // scrollDirection: Axis.horizontal,
//               itemCount: data!.dailyForecasts!.length,
//               itemBuilder: (context, index) {
//                 final daily = data.dailyForecasts![index];
//                 String getIcons() {
//                   if (daily.day!.icon == 12) {
//                     return iconxx.value;
//                   }
//                   if (daily.day!.icon == 4) {
//                     return iconx.value;
//                   }
//                   if (daily.day!.icon == 18) {
//                     return icons.value;
//                   } else {
//                     return iconx.value;
//                   }
//                 }

//                 DateTime date = daily.date!;
//                 final weatherDate = DateFormat('EEE,MMM,yy').format(date);
//                 print(weatherDate);
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                   ),
//                   child: GlassmorphicContainer(
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             weatherDate,
//                             style:
//                                 TextStyle(fontSize: 15.sp, color: Colors.white),
//                           ),
//                           Image.asset(
//                             getIcons(),
//                             width: 25,
//                             height: 25,
//                           ),
//                           Text(
//                             '${daily.temperature!.minimum!.value.toString()}\u00B0 / ${daily.temperature!.maximum!.value.toString()}\u00B0',
//                             style:
//                                 TextStyle(fontSize: 15.sp, color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     width: 100,
//                     height: 50,
//                     borderRadius: 10,
//                     blur: 5,
//                     border: 0,
//                     linearGradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           const Color(0xFFffffff).withOpacity(0.1),
//                           const Color(0xFFFFFFFF).withOpacity(0.05),
//                         ],
//                         stops: const [
//                           0.1,
//                           1,
//                         ]),
//                     borderGradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color(0xFFffffff).withOpacity(0.5),
//                         Color((0xFFFFFFFF)).withOpacity(0.5),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         );
//       },
//     );
//   }
// }
