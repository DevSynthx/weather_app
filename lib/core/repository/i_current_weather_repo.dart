import 'package:weather_app/core/model/current_weather.dart';

abstract class ICurrentWeatherRepo {
  Future<CurrentWeather> currentWeather([String cityName = 'bariga']);
  Future<CurrentWeather> weatherCityName([String cityName = '']);
  Future<CurrentWeather> hourlyForecast([String cityName = 'bariga']);
}
