import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/storage/share_pref.dart';

class Location {
  double? latitude;
  double? longitude;
  String apiKey = '2e9714911e1deb0a2ee62104c0b5928b';
  // int status;

  /// async and await are used for time consuming tasks
  /// Get your current loatitude and longitude
  /// Location accuracy depends on the type of app high,low ,
  /// high accuracy also result in more power consumed
  Future<void> getCurrentLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      prefs.setString(Constant.latitude, position.latitude.toString());
      prefs.setString(Constant.longitude, position.longitude.toString());
      // StorageUtil.putString(Constant.latitude, position.latitude.toString());
      // StorageUtil.putString(Constant.longitude, position.longitude.toString());

      latitude = position.latitude;
      longitude = position.longitude;
      // print('i printed from location class : ${latitude}');
      // print('i printed from location class : ${longitude}');
    } catch (e) {
      print(e);
    }
  }
}
