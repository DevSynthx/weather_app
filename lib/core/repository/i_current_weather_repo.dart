import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/model/daily_weather_data.dart';
import 'package:weather_app/core/model/get_user_location.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/model/one_day_weather.dart';
import 'package:weather_app/core/model/user_location_weather.dart';
import 'package:weather_app/core/model/weather_by_current_location.dart';

abstract class ICurrentWeatherRepo {
  // Future currentWeather(String cityName);
  Future<GetLocation> getLocationData();
  Future<List<CurrentWeatherData>> getWeatherData();
  Future<DailyWeatherData> dailyData();
  Future<List<HourlyWeatherData>> hourlyWeatherData();
  Future<OneDayWeather> oneDayData();
}
