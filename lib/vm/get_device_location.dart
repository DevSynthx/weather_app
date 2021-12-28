// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:weather_app/core/controller/generic_state_notifier.dart';
// import 'package:weather_app/core/model/current_weather.dart';
// import 'package:weather_app/core/repository/current_weather_repo.dart';

// final getDeviceLocationProvider =
//     StateNotifierProvider.autoDispose<DeviceWeatherVM, RequestState>(
//         (ref) => DeviceWeatherVM(ref));

// class DeviceWeatherVM extends RequestStateNotifier {
//   final WeatherRepository _weatherRepository;

//   DeviceWeatherVM(Ref ref) : _weatherRepository = ref.read(weatherProvider);

//   void getUserLocation() =>
//       makeRequest(() => _weatherRepository.getUserLocation());

//   // void searchCity([String cityName = '']) =>
//   //     makeRequest(() => _weatherRepository.weatherCityName(cityName));
// }
