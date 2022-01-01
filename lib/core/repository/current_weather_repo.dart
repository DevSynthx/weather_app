import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/model/daily_weather_data.dart';
import 'package:weather_app/core/model/get_user_location.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/model/one_day_weather.dart';
import 'package:weather_app/core/model/user_location_weather.dart';
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
  Future<GetLocation> getLocationData() async {
    final getData = await _weatherService.getLocationData();
    return getData;
  }

  @override
  Future<List<CurrentWeatherData>> getWeatherData() async {
    final weatherData = await _weatherService.getWeatherData();
    return weatherData;
  }

  @override
  Future<DailyWeatherData> dailyData() async {
    final dailyData = await _weatherService.dailyData();
    return dailyData;
  }

  @override
  Future<List<HourlyWeatherData>> hourlyWeatherData() async {
    final hourlyData = await _weatherService.hourlyWeatherData();
    return hourlyData;
  }

  @override
  Future<OneDayWeather> oneDayData() async {
    final oneDay = await _weatherService.oneDayData();
    return oneDay;
  }

  // @override
  // Future getUserLocation() async {
  //   final getLocation = await _weatherService.getUserLocation();
  //   return getLocation;
  // }

}
