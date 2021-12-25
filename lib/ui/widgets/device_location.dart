import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/services/get_user_location.dart';
import 'package:weather_app/vm/get_weather_data.dart';

class DeviceLocation extends HookConsumerWidget {
  const DeviceLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(getWeatherDataProvider);
    final location = useState(0.0);

    Future getLocation() async {
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

      location.value = position.latitude;
    }

    useEffect(() {
      getLocation();
      // ref.read(getDeviceLocationProvider.notifier).getUserLocation();
      Location location = Location();
      location.getCurrentLocation();
    });

    return

        // Text(
        //   location.value.toString(),
        //   style: TextStyle(fontSize: 20, color: Colors.red),
        // );

        vm.when(
      idle: () {
        return const Center(child: Text('nothing to display'));
      },
      loading: () {
        return const Center(child: Text('nothing to display'));
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      success: (data) {
        print(data!.name.toString());
        return Text(data.name.toString());
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:weather_app/vm/get_device_location.dart';
// import 'package:weather_app/vm/get_weather_coordinates.dart';

// class DeviceLocationDisplay extends HookConsumerWidget {
//   const DeviceLocationDisplay({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final vm = ref.watch(weatherByCordinateProvider);

//     bool isLoading = false;

//     // Future getUserLocation() async {
//     //   isLoading = true;
//     //   ref.read(getDeviceLocationProvider.notifier);
//     //   isLoading = true;
//     // }

//     useEffect(() {
//       // getLocation();
//       ref.read(getDeviceLocationProvider.notifier).getUserLocation();

//       // getAddressFromLatLong();
//       // location.value = formatted;
//     });
//     return vm.when(
//       idle: () {
//         return const Center(child: CircularProgressIndicator());
//       },
//       loading: () {
//         return const Center(child: CircularProgressIndicator());
//       },
//       error: (Object error, StackTrace stackTrace) {
//         print(error);
//         return Text(error.toString());
//       },
//       success: (data) {
//         return Row(
//           children: [
//             const Icon(
//               Icons.location_on_outlined,
//               color: Colors.white,
//               size: 20,
//             ),
//             Text(
//               "${data!.city!.name.toString()} ",
//               style: TextStyle(color: Colors.white, fontSize: 20.sp),
//             ),
//             const Gap(10),
//             Text(
//               data.city!.country == "NG" ? "Nigeria" : "NG",

//               // "${data.city!.country.toString()}",
//               style: TextStyle(color: Colors.white, fontSize: 20.sp),
//             ),
//             // Image.network(
//             //   "http://openweathermap.org/img/wn/02d@2x.png",
//             //   height: 35,
//             //   width: 35,
//             // ),
//             const Gap(10),
//             Text(
//               (dynamic temp) {
//                 final celcius = (temp / 10).toStringAsFixed(1);
//                 return "${celcius.toString()}${"\u2103"}";
//               }(
//                 data.list![0].temp!.morn,
//               ),
//               // "${data.city!.name.toString()}  "
//               // "${data.city!.country.toString()}",
//               style: TextStyle(color: Colors.white, fontSize: 20.sp),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
