import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/model/current_weather.dart';
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
  Future<CurrentWeather> currentWeather([String cityName = '']) async {
    final current = await _weatherService.currentWeather(cityName);
    return current;
  }

  @override
  Future<CurrentWeather> weatherCityName([String cityName = '']) async {
    final city = await _weatherService.currentWeather(cityName);
    return city;
  }

  @override
  Future<CurrentWeather> hourlyForecast([String cityName = 'bariga']) async {
    return await _weatherService.hourlyForecast(cityName);
  }
}
