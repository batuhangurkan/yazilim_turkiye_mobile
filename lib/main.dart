
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yazilim_turkiye_mobile/Pages/BottomNavbar.dart';
import 'package:yazilim_turkiye_mobile/Pages/LoginPage.dart';
import 'package:yazilim_turkiye_mobile/Pages/Settings.dart';
import 'package:yazilim_turkiye_mobile/Pages/SplashPage.dart';

import 'Pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const Color black = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Vega IK Mobile',
          theme: ThemeData(
            splashColor: Colors.white,

            useMaterial3: false,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black)),
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: MaterialColor(
              0xFF000000,
              <int, Color>{
                50: black,
                100: black,
                200: black,
                300: black,
                400: black,
                500: black,
                600: black,
                700: black,
                800: black,
                900: black,
              },
            ),
            fontFamily: 'Sora',

          ),
          home: SplashPage(),
          routes: {
            '/splash': (context) => const SplashPage(),
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/bottomnavbar': (context) => const BottomNavbar(),
            '/settings': (context) => const SettingsPage()
          },
        );
      },
    );
  }
}