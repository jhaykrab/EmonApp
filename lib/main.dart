import 'package:flutter/material.dart';
import 'package:Emon/screens/register_devices_screen.dart';
import 'package:Emon/screens/add_device_screen.dart';
import 'package:Emon/screens/SplashScreenLogo.dart';
import 'package:Emon/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emon',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // Set SplashScreenLogo as the initial route
      initialRoute: SplashScreenLogo.routeName,
      routes: {
        SplashScreenLogo.routeName: (context) => const SplashScreenLogo(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        DevicesScreen.routeName: (context) => const DevicesScreen(),
      },
    );
  }
}
