import 'package:flutter/material.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/pages_screen/login_page.dart';
import 'package:housing_society/pages_screen/profile_details.dart';
import 'package:housing_society/pages_screen/signup_page.dart';
import 'package:housing_society/society_service/all_services.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SignUpPage.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case ProfileDetails.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileDetails());
    case ServicesScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ServicesScreen());
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
