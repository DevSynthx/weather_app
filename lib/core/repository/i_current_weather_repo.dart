import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/model/weather_by_current_location.dart';

abstract class ICurrentWeatherRepo {
  Future currentWeather(String cityName);
  Future getWeatherData();
  // Future getUserLocation();
}
