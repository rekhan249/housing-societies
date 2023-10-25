import 'package:flutter/material.dart';
import 'package:housing_society/administer/add_services.dart';
import 'package:housing_society/administer/admin_panel.dart';
import 'package:housing_society/administer/dashboard.dart';
import 'package:housing_society/administer/delete_services.dart';
import 'package:housing_society/administer/update_services.dart';
import 'package:housing_society/bottom_nav/bottom_nav_services.dart';
import 'package:housing_society/bottom_nav/bottom_nav_user.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/pages_screen/login_page.dart';
import 'package:housing_society/pages_screen/profile_details.dart';
import 'package:housing_society/pages_screen/signup_page.dart';
import 'package:housing_society/society_service/all_services.dart';
import 'package:housing_society/society_service/payment_method.dart';

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
    case AdminPanel.routeName:
      return MaterialPageRoute(builder: (context) => const AdminPanel());
    case Dashboard.routeName:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case AddServices.routeName:
      return MaterialPageRoute(builder: (context) => const AddServices());

    case UpdateServices.routeName:
      final args = settings.arguments as ServiceModel;
      return MaterialPageRoute(
          builder: (context) =>
              UpdateServices(serviceId: args.sid, servicesData: args));
    case DeletedServices.routeName:
      return MaterialPageRoute(builder: (context) => const DeletedServices());
    case BottomNavServices.routeName:
      return MaterialPageRoute(builder: (context) => const BottomNavServices());
    case BottomNavUser.routeName:
      return MaterialPageRoute(builder: (context) => const BottomNavUser());
    case PaymentMethodology.routeName:
      return MaterialPageRoute(
          builder: (context) => const PaymentMethodology());
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
