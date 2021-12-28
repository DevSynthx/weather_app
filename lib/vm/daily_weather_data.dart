import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/daily_weather_data.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final dailyDataProvider = StateNotifierProvider.autoDispose<DailyWeatherDataVM,
    RequestState<DailyWeatherData>>((ref) => DailyWeatherDataVM(ref));

class DailyWeatherDataVM extends RequestStateNotifier<DailyWeatherData> {
  final WeatherRepository _weatherRepository;

  DailyWeatherDataVM(Ref ref) : _weatherRepository = ref.read(weatherProvider) {
    getWeatherData();
  }

  void getWeatherData() => makeRequest(() => _weatherRepository.dailyData());
}
