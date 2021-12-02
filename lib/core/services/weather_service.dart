import 'package:dio/dio.dart';
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
  Future<CurrentWeather> currentWeather() async {
    const url =
        "forecast/daily?q=bariga&cnt=5&appid=542ffd081e67f4512b705f89d2a611b2";

    try {
      final response = await _dio.get(
        url,
      );
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
}
