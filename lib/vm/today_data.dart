import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/model/one_day_weather.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final todayWeatherProvider = StateNotifierProvider.autoDispose<
    TodayWeatherDataVM,
    RequestState<OneDayWeather>>((ref) => TodayWeatherDataVM(ref));

class TodayWeatherDataVM extends RequestStateNotifier<OneDayWeather> {
  final WeatherRepository _weatherRepository;

  TodayWeatherDataVM(Ref ref) : _weatherRepository = ref.read(weatherProvider) {
    todayWeatherData();
  }

  void todayWeatherData() => makeRequest(() => _weatherRepository.oneDayData());
}
