import 'package:flutter/material.dart';
import 'package:housing_society/constants/size_config.dart';
import 'package:housing_society/splash_screens/components/body.dart';

class SplashScreen extends StatelessWidget {
  static const String nameRoute = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: const Body(),
    );
  }
}
