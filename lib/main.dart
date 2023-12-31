import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/pages_screen/login_page.dart';
import 'package:housing_society/providers/addservices_provide.dart';
import 'package:housing_society/providers/date_provider.dart';
import 'package:housing_society/providers/dropdown_provider.dart';
import 'package:housing_society/providers/google_sign_in_provider.dart';
import 'package:housing_society/providers/login_provider.dart';
import 'package:housing_society/providers/password_provider.dart';
import 'package:housing_society/providers/profile_details_provider.dart';
import 'package:housing_society/providers/profile_pic_provider.dart';
import 'package:housing_society/providers/rating_provider.dart';
import 'package:housing_society/providers/requestprovider.dart';
import 'package:housing_society/providers/serviceProAvail_provider.dart';
import 'package:housing_society/providers/signup_provider.dart';
import 'package:housing_society/providers/update_services.dart';
import 'package:housing_society/routes/route_manage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDWHtApT2f-Z4n2V8kwcGg-ne5DaiqUVZI",
            authDomain: "house-society-9cf1a.firebaseapp.com",
            projectId: "house-society-9cf1a",
            storageBucket: "house-society-9cf1a.appspot.com",
            messagingSenderId: "446763935758",
            appId: "1:446763935758:web:75efb09d43f4ddc0da345f"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    User? user = getCurrentUser();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LoginProvider()),
            ChangeNotifierProvider(create: (context) => SignUpProvider()),
            ChangeNotifierProvider(create: (context) => PasswordProvider()),
            ChangeNotifierProvider(
                create: (context) => ProfileDetailProvider()),
            ChangeNotifierProvider(create: (context) => GalleryImageProvider()),
            ChangeNotifierProvider(create: (context) => DateProvider()),
            ChangeNotifierProvider(create: (context) => RatingProvider()),
            ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
            ChangeNotifierProvider(create: (context) => AddServicesProvider()),
            ChangeNotifierProvider(create: (context) => RequestProvider()),
            ChangeNotifierProvider(create: (context) => ApprovedRequest()),
            ChangeNotifierProvider(
                create: (context) => UpdateServicesProvider()),
            ChangeNotifierProvider(
                create: (context) => GenderDropDownProvider()),
            ChangeNotifierProvider(
                create: (context) => CityCountryDropDownProvider()),
            ChangeNotifierProvider(
                create: (context) => ServiceProAvailProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Society Management System',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            onGenerateRoute: (settings) => generateRoutes(settings),
            // home: user != null && user.displayName != null
            //     ? const BottomNavUser() // Redirect to the main screen
            //     : const LoginPage(),
            home: const LoginPage(),
          )),
    );
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
