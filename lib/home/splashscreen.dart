import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds before navigating to the home screen.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body: Center(
  child: Image.asset(
  'quran/images/light_mode/splash.png',
  fit: BoxFit.cover, // Set image to cover the entire space
  ),
  ),
  );
  }
}
