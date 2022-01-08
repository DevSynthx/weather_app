import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/ui/widgets/snackBar/snack_bar.dart';

class ConnectionUtils {
  static getActiveStatus(BuildContext context) async {
    final internet =
        InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        return AppSnackBar.showSuccessSnackBar(context,
            message: 'is connected');
      } else {
        return AppSnackBar.showSuccessSnackBar(context,
            message: 'is disconnected');
      }
    });

    await internet.cancel();
  }
}
