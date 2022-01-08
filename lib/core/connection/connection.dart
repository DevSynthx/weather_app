import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionUtil {
  static Future<bool> getActiveStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}

// class ConnectionUtils {
//   static Future getActiveStatus() async {
//     var listener = (DataConnectionChecker().onStatusChange.listen((status) {
//       if (status == DataConnectionStatus.connected) {
//         print("You are now connected to the internet");
//       }
//       if (status == DataConnectionStatus.disconnected) {
//         print("you dont have an internet connection");
//       }
//     }));
//     await Future.delayed(const Duration(seconds: 30));
//     await listener.cancel();

//     // return false;
//   }
// }
