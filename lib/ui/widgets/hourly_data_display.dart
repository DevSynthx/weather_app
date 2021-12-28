import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/vm/hourly_weather_data_vm.dart';

class HourlyWeather extends HookConsumerWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(hourlyDataProvider);
    final iconx = useState('assets/images/04-s.png');
    final iconxx = useState('assets/images/12-s.png');
    final icons = useState('assets/images/18-s.png');
    return vm.when(
      idle: () {
        return const Center(child: Text('Loading loaction'));
      },
      loading: () {
        return const Center(child: Text('Loading loaction'));
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      success: (data) {
        return SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final hourly = data[index];
                String getIcons() {
                  if (hourly.weatherIcon == 12) {
                    return iconxx.value;
                  }
                  if (hourly.weatherIcon == 4) {
                    return iconx.value;
                  }
                  if (hourly.weatherIcon == 18) {
                    return icons.value;
                  } else {
                    return iconx.value;
                  }
                }

                DateTime date = hourly.dateTime!;
                final time = DateFormat.Hm().format(date);
                print(time);
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
}
