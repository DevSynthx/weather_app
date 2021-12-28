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
      bool serviceEnabled;
      LocationPermission permission;
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
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

//  Future getLocation() async {
//       bool serviceEnabled;
//       LocationPermission permission;
//       // Test if location services are enabled.
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         // Location services are not enabled don't continue
//         // accessing the position and request users of the
//         // App to enable the location services.
//         await Geolocator.openLocationSettings();
//         return Future.error('Location services are disabled.');
//       }
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           // Permissions are denied, next time you could try
//           // requesting permissions again (this is also where
//           // Android's shouldShowRequestPermissionRationale
//           // returned true. According to Android guidelines
//           // your App should show an explanatory UI now.
//           return Future.error('Location permissions are denied');
//         }
//       }
//       if (permission == LocationPermission.deniedForever) {
//         // Permissions are denied forever, handle appropriately.
//         return Future.error(
//             'Location permissions are permanently denied, we cannot request permissions.');
//       }
//       // Position position = await Geolocator.getCurrentPosition(
//       //     desiredAccuracy: LocationAccuracy.high);

    
//     }
