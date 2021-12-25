import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/model/weather_by_current_location.dart';
import 'package:weather_app/core/repository/i_current_weather_repo.dart';
import 'package:weather_app/core/services/weather_service.dart';

final weatherProvider = Provider<WeatherRepository>((ref) {
  final weatherService = ref.watch(weatherServiceProvider);
  return WeatherRepository(weatherService);
});

class WeatherRepository extends ICurrentWeatherRepo {
  final WeatherService _weatherService;
  WeatherRepository(this._weatherService);

  @override
  Future currentWeather(String cityName) async {
    final current = await _weatherService.currentWeather(cityName);
    return current;
  }

  @override
  Future getWeatherData() async {
    final getData = await _weatherService.getWeatherData();
    return getData;
  }

  // @override
  // Future getUserLocation() async {
  //   final getLocation = await _weatherService.getUserLocation();
  //   return getLocation;
  // }

}
