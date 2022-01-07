import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/global/constant.dart';
import 'package:weather_app/core/services/get_user_location.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/ui/screen/maps.dart';
import 'package:weather_app/utils/navigator.dart';
import 'package:weather_app/vm/get_location_data.dart';

import 'loading_progress.dart';

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
      idle: () => const LoadingProgress(),
      loading: () => const LoadingProgress(),
      error: (Object error, StackTrace stackTrace) {
        return Center(child: Text(error.toString()));
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => context.navigate(ViewMap(
                latitude: data.geoPosition!.latitude!,
                longitude: data.geoPosition!.longitude!,
              )),
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.grey[100],
              ),
            ),
            Gap(10.w),
            Text(
              data.localizedName.toString(),
              style: TextStyle(color: Colors.grey[100], fontSize: 20.sp),
            ),
            Gap(10.w),
            Text(
              data.country!.englishName.toString(),
              style: TextStyle(color: Colors.grey[100], fontSize: 20.sp),
            ),
          ],
        );
      },
    );
  }
}
