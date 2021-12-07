import 'package:weather_app/core/model/current_weather.dart';

abstract class ICurrentWeatherRepo {
  Future<CurrentWeather> currentWeather([String cityName = 'Ikeja']);
  Future<CurrentWeather> weatherCityName([String cityName = '']);
  Future<CurrentWeather> hourlyForecast([String cityName = 'bariga']);
  Future<CurrentWeather> getWeatherData(
      {required double currentLatitude, required double currentLongitude});
  Future getUserLocation();
}
