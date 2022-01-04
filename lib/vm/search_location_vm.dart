import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/user_location_weather.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

final searchWeatherDataProvider = StateNotifierProvider.autoDispose<
    SearchWeatherDataVM,
    RequestState<List<CurrentWeatherData>>>((ref) => SearchWeatherDataVM(ref));

class SearchWeatherDataVM
    extends RequestStateNotifier<List<CurrentWeatherData>> {
  final WeatherRepository _weatherRepository;

  SearchWeatherDataVM(Ref ref)
      : _weatherRepository = ref.read(weatherProvider) {
    getWeatherData();
  }

  void getWeatherData() =>
      makeRequest(() => _weatherRepository.searchLocationWeather());
}
