import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/model/current_weather.dart';
import 'package:weather_app/core/model/weather_by_current_location.dart';
import 'package:weather_app/core/services/get_user_location.dart';
import 'package:weather_app/core/storage/share_pref.dart';
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
  Future currentWeather(String cityName) async {
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

        throw result.errorMessage!;
      } else {
        throw e.error;
      }
    }
  }

  // Future getUserLocation() async {
  //   final LocationWeather weatherData;

  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   final _result = await getWeatherData(
  //       latitude: position.latitude, longitude: position.longitude);
  //   weatherData = _result;
  //   print("${position.latitude} was printed in user location");
  // }

  Future getWeatherData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getString(Constant.latitude);
    final longitude = prefs.getString(Constant.longitude);
    final url =
        "weather?lat=$latitude&lon=$longitude&appid=542ffd081e67f4512b705f89d2a611b2";

    try {
      final response = await _dio.get(
        url,
      );
      final res = LocationWeather.fromJson(response.data);
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
}
