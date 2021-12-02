import 'package:weather_app/core/model/current_weather.dart';

abstract class ICurrentWeatherRepo {
  Future<CurrentWeather> currentWeather();
}
