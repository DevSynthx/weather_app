import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/utils/error_interceptor.dart';
import 'package:weather_app/core/utils/failure_message.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(ref.watch(dioProvider));
});

final dioProvider = Provider((ref) => Dio(BaseOptions(
    receiveTimeout: 100000,
    connectTimeout: 100000,
    baseUrl: Constant.baseUrl)));

class WeatherService {
  final Dio _dio;
  WeatherService(this._dio) {
    _dio.interceptors.add(ErrorInterceptor());
    _dio.interceptors.add(PrettyDioLogger());
  }

  /// displays Daily forecast by city
  Future<CurrentWeather> currentWeather([String cityName = 'bariga']) async {
    final url =
        "forecast/daily?q=$cityName&cnt=5&appid=542ffd081e67f4512b705f89d2a611b2";
    var queryParameters = {"CityName": cityName};

    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      final res = CurrentWeather.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        print(result.errorMessage);
        throw result.errorMessage!;
      } else {
        throw e.error;
      }
    }
  }

  /// displays hourly forecast by city
  Future<CurrentWeather> hourlyForecast([String cityName = 'Ikeja']) async {
    final url =
        "forecast/hourly?q=$cityName&cnt=5&appid=542ffd081e67f4512b705f89d2a611b2";
    var queryParameters = {"CityName": cityName};

    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      final res = CurrentWeather.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);

        throw result.errorMessage!;
      } else {
        throw e.error;
      }
    }
  }

  Future getUserLocation() async {
    double currentLatitude;
    double currentLongitude;
    CurrentWeather weatherData;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentLongitude = position.longitude;
    currentLatitude = position.latitude;
    if (currentLatitude == null || currentLongitude == null) {
      return;
      //handle a notification saying no location
    }
    final _result = await getWeatherData(
        currentLatitude: currentLatitude, currentLongitude: currentLongitude);
    weatherData = _result;
  }

  Future<CurrentWeather> getWeatherData(
      {required double currentLatitude,
      required double currentLongitude}) async {
    final url =
        "forecast/daily?lat=$currentLatitude&lon=$currentLongitude&appid=542ffd081e67f4512b705f89d2a611b2&cnt=5";
    try {
      final response = await _dio.get(
        url,
      );
      final res = CurrentWeather.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        Failure result = Failure.fromJson(e.response!.data);
        print(result.errorMessage);
        throw result.errorMessage!;
      } else {
        throw e.error;
      }
    }
  }
}
