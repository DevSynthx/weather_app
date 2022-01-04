import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/controller/generic_state_notifier.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/model/weather_by_location.dart';
import 'package:weather_app/core/repository/current_weather_repo.dart';

// final weatherByLocationProvider = StateNotifierProvider.autoDispose<
//         WeatherByLocationDataVM, RequestState<List<WeatherByLocation>>>(
//     (ref) => WeatherByLocationDataVM(ref));

// class WeatherByLocationDataVM
//     extends RequestStateNotifier<List<WeatherByLocation>> {
//   final WeatherRepository _weatherRepository;

//   WeatherByLocationDataVM(Ref ref)
//       : _weatherRepository = ref.read(weatherProvider) {
//     getLocationWeatherData();
//   }

//   void getLocationWeatherData([String cityName = '']) =>
//       makeRequest(() => _weatherRepository.weatherByLocation(cityName));
// }

final weatherByLocationProvider = FutureProvider.autoDispose
    .family<List<WeatherByLocation>, String>((ref, cityName) async {
  return ref.watch(weatherProvider).weatherByLocation(cityName);
});
