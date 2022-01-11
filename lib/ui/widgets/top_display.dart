import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/connection/connection.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/ui/widgets/toggle_state.dart';
import 'package:weather_app/vm/internet_state.dart';

class GreetingText extends HookConsumerWidget {
  const GreetingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(toggleStateProvider.state);
    var dateTimer = DateTime.now();
    String formatted = DateFormat(' d, MMM yyyy').format(dateTimer);

    // useEffect(() {
    //   ConnectionUtils.getActiveStatus(context);
    // });

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
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(
            formatted,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              toggle.state = !toggle.state;
              print(toggle.state);
            },
            child: Row(
              children: [
                toggle.state == false
                    ? Text(
                        '\u00B0C',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    : Text(
                        '\u00B0C',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                Text(
                  '/',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                toggle.state == false
                    ? Text(
                        '\u00B0F',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    : Text(
                        '\u00B0F',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
