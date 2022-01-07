import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Internet extends StateNotifier<bool> {
  Internet() : super(true);

  final internet = InternetConnectionChecker().onStatusChange.listen((status) {
    if (status == InternetConnectionStatus.connected) {
      print('is connected');
    } else {
      InternetConnectionStatus.disconnected;
      print('disconnected');
    }
  });
}

final internetStateProvider = StateProvider((ref) => Internet());

final internetProvider = StateProvider<Internet>((ref) {
  return Internet();
});
