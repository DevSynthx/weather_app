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
  Future<CurrentWeather> currentWeather() async {
    final current = await _weatherService.currentWeather();
    return current;
  }
}
