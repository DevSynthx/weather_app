import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/user_location_weather.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final currentWeatherDataProvider = StateNotifierProvider.autoDispose<
    CurrentWeatherDataVM,
    RequestState<List<CurrentWeatherData>>>((ref) => CurrentWeatherDataVM(ref));

class CurrentWeatherDataVM
    extends RequestStateNotifier<List<CurrentWeatherData>> {
  final WeatherRepository _weatherRepository;

  CurrentWeatherDataVM(Ref ref)
      : _weatherRepository = ref.read(weatherProvider) {
    getWeatherData();
  }

  void getWeatherData() =>
      makeRequest(() => _weatherRepository.getWeatherData());
}
