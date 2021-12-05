import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:weather_app/ui/widgets/animated_search.dart';
import 'package:weather_app/vm/current_weather_vm.dart';

class TopHeader extends HookConsumerWidget {
  const TopHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(currentWeatherProvider);
    final searchController = useTextEditingController();
    return Row(
      children: [
        AnimSearchBar(
          textController: searchController,
          width: 250.2,
          helpText: "Search...",
          style: const TextStyle(color: Colors.white),
          color: const Color(0xffffffff).withOpacity(0.10),
          closeSearchOnSuffixTap: true,
          closeSearchOnPrefixTap: true,
          autoFocus: true,
          onChange: (value) {
            Debounce.seconds(
                1,
                () => ref
                    .read(currentWeatherProvider.notifier)
                    .getWeather(value));
          },
        ),
        const Spacer(),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              color: const Color(0xffffffff).withOpacity(0.10),
              borderRadius: BorderRadius.circular(10.r)),
          child: const Icon(
            Icons.notifications_none,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
