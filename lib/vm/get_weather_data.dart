import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final getWeatherDataProvider =
    StateNotifierProvider.autoDispose<WeatherDataVM, RequestState>(
        (ref) => WeatherDataVM(ref));

class WeatherDataVM extends RequestStateNotifier {
  final WeatherRepository _weatherRepository;

  WeatherDataVM(Ref ref) : _weatherRepository = ref.read(weatherProvider) {
    getWeatherData();
  }

  void getWeatherData() =>
      makeRequest(() => _weatherRepository.getWeatherData());
}
