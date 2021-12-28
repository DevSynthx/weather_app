import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/services/get_user_location.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/vm/get_location_data.dart';

class DeviceLocation extends HookConsumerWidget {
  const DeviceLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(getWeatherDataProvider);

    useEffect(() {
      Location location = Location();
      location.getCurrentLocation();
    });

    return vm.when(
      idle: () {
        return const Center(child: Text('Loading loaction'));
      },
      loading: () {
        return const Center(child: Text('Loading loaction'));
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      success: (data) {
        StorageUtil.setString(Constant.locationKey, data!.key);
        // print(data!.key);

        // String tempDisplay() {
        //   return (dynamic temp) {
        //     final celcius = (temp / 10).toStringAsFixed(1);
        //     return celcius.toString();
        //   }(
        //     data!.main.tempMin,
        //   );
        // }

        // print(data!.name.toString());
        // final location = StorageUtil.getString(Constant.locationKey);
        // print(location);
        return Row(
          children: [
            Text(
              data.localizedName.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
            Gap(10.w),
            Text(
              data.country!.englishName.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20.sp),
            ),
          ],
        );
      },
    );
  }
}
