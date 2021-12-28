// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:weather_app/core/controller/generic_state_notifier.dart';
// import 'package:weather_app/core/model/current_weather.dart';
// import 'package:weather_app/core/repository/current_weather_repo.dart';

// final currentWeatherProvider =
//     StateNotifierProvider.autoDispose<CurrentWeatherVM, RequestState>(
//         (ref) => CurrentWeatherVM(ref));

// class CurrentWeatherVM extends RequestStateNotifier {
//   final WeatherRepository _weatherRepository;

//   CurrentWeatherVM(Ref ref) : _weatherRepository = ref.read(weatherProvider) {
//     getWeather();
//   }

//   void getWeather([String cityName = 'Ikeja']) =>
//       makeRequest(() => _weatherRepository.currentWeather(cityName));
// }
