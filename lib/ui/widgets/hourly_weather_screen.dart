import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/vm/hourly_weather.dart';

class HourlyForecastScreen extends HookConsumerWidget {
  const HourlyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(hourlyWeatherProvider);
    return vm.when(
      idle: () {
        return const Center(child: CircularProgressIndicator());
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      success: (value) {
        return Expanded(
          child: ListView.separated(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Text(
                'data',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        );
      },
    );
  }
}
