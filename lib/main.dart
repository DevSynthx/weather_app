import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/ui/home_page.dart';
import 'package:weather_app/utils/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () => MaterialApp(
              navigatorKey: navigator.key,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'DM Sans',
                textTheme: GoogleFonts.dmSansTextTheme(
                  Theme.of(context).textTheme,
                ),
                // primarySwatch: Colors.blue,
              ),
              home: const HomePage(),
            ));
  }
}
