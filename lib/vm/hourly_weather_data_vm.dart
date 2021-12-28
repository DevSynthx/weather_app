import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final hourlyDataProvider = StateNotifierProvider.autoDispose<
    HourlyWeatherDataVM,
    RequestState<List<HourlyWeatherData>>>((ref) => HourlyWeatherDataVM(ref));

class HourlyWeatherDataVM
    extends RequestStateNotifier<List<HourlyWeatherData>> {
  final WeatherRepository _weatherRepository;

  HourlyWeatherDataVM(Ref ref)
      : _weatherRepository = ref.read(weatherProvider) {
    getWeatherData();
  }

  void getWeatherData() =>
      makeRequest(() => _weatherRepository.hourlyWeatherData());
}
