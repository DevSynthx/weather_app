import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/model/daily_weather_data.dart';
import 'package:weather_app/core/model/error_data.dart';
import 'package:weather_app/core/model/get_user_location.dart';
import 'package:weather_app/core/model/hourly_weather_data.dart';
import 'package:weather_app/core/model/user_location_weather.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/core/utils/error_interceptor.dart';

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

  Future<GetLocation> getLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getString(Constant.latitude);
    final longitude = prefs.getString(Constant.longitude);
    final url =
        'locations/v1/cities/geoposition/search?apikey=${Constant.apiKey}=$latitude,$longitude';

    // "weather?lat=$latitude&lon=$longitude&appid=542ffd081e67f4512b705f89d2a611b2";

    try {
      final response = await _dio.get(
        url,
      );
      final res = GetLocation.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);

        throw result.code!;
      } else {
        throw e.error;
      }
    }
  }

  Future<List<CurrentWeatherData>> getWeatherData() async {
    final locationKey = StorageUtil.getString(Constant.locationKey);

    final url =
        'currentconditions/v1/$locationKey?apikey=${Constant.apiKey}&details=true';

    // "weather?lat=$latitude&lon=$longitude&appid=542ffd081e67f4512b705f89d2a611b2";

    try {
      final response = await _dio.get(
        url,
      );
      final res = List<CurrentWeatherData>.from(
          response.data.map((x) => CurrentWeatherData.fromJson(x)));
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);

        throw result.code!;
      } else {
        throw e.error;
      }
    }
  }

  Future<DailyWeatherData> dailyData() async {
    final locationKey = StorageUtil.getString(Constant.locationKey);
    final url =
        'forecasts/v1/daily/5day/$locationKey?apikey=${Constant.apiKey}';

    try {
      final response = await _dio.get(
        url,
      );
      final res = DailyWeatherData.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);

        throw result.code!;
      } else {
        throw e.error;
      }
    }
  }

  Future<List<HourlyWeatherData>> hourlyWeatherData() async {
    final locationKey = StorageUtil.getString(Constant.locationKey);
    // print(feyi);
    final url =
        'forecasts/v1/hourly/12hour/$locationKey?apikey=${Constant.apiKey}';

    try {
      final response = await _dio.get(
        url,
      );
      final res = List<HourlyWeatherData>.from(
          response.data.map((x) => HourlyWeatherData.fromJson(x)));
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != '') {
        ErrorData result = ErrorData.fromJson(e.response!.data);
        print(result.code);

        throw result.code!;
      } else {
        throw e.error;
      }
    }
  }
}
