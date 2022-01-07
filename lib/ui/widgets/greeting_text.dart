import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/vm/internet_state.dart';

class GreetingText extends HookConsumerWidget {
  const GreetingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internet = ref.watch(internetProvider.state);
    String greetingMessage() {
      var timeNow = DateTime.now().hour;
      print("it is $timeNow");

      if (timeNow <= 4) {
        return 'Its midnight 🤨 \nwhy are you awake';
      } else if ((timeNow >= 5) && (timeNow <= 12)) {
        return 'Good Morning Dave 😊';
      } else if ((timeNow > 12) && (timeNow <= 16)) {
        return 'Good Morning, David 😌';
      } else if ((timeNow > 16) && (timeNow < 23)) {
        return 'Good Evening 🙂';
      } else {
        return 'Good evening 🤨 \nwhy are you awake';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 80),
      child: Column(
        children: [
          Text(
            greetingMessage(),
            style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
