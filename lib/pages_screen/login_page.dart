import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/pages_screen/signup_page.dart';
import 'package:housing_society/providers/google_sign_in_provider.dart';
import 'package:housing_society/providers/login_provider.dart';
import 'package:housing_society/providers/password_provider.dart';
import 'package:housing_society/widgets/email_field.dart';
import 'package:housing_society/widgets/password_field.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final RoundedLoadingButtonController _googleController =
      RoundedLoadingButtonController();
  bool showLoader = false;

  void _submitLoginForm(BuildContext context) async {
    bool isvalid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isvalid) {
      return;
    }
    _formKey.currentState!.save();

    Provider.of<LoginProvider>(context, listen: false).inLoginForm(
        context, _emailController.text.trim(), _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: showLoader
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, bottom: 10, top: 20),
                  child: ListView(
                    children: [
                      SizedBox(height: 10.h),
                      Center(
                          child: Image(
                              image: const AssetImage(
                                  "assets/images/society.jfif"),
                              height: 180.h,
                              width: 250.w)),
                      SizedBox(height: 10.h),
                      Center(
                          child: Text('Login Page',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 5, 78, 139)))),
                      SizedBox(height: 15.h),
                      EmailField(emailController: _emailController),
                      SizedBox(height: 15.h),
                      Consumer<PasswordProvider>(
                          builder: ((context, pp, child) => PasswordField(
                              passwordController: _passwordController,
                              passwordProvider: passwordProvider))),
                      SizedBox(height: 07.h),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Forget Password',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 185, 10, 86),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp)))),
                      SizedBox(height: 07.h),
                      SizedBox(
                          height: 50.h,
                          width: double.infinity.w,
                          child: TextButton(
                              onPressed: () => _submitLoginForm(context),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 185, 10, 86))),
                              child: Text('Sign In',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)))),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUpPage())))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 05.h),
                      Center(
                          child: Text('or Signup with',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 10.h),
                      SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: Consumer<GoogleSignInProvider>(
                            builder: (context, googleSignIn, child) =>
                                RoundedLoadingButton(
                                    onPressed: () async {
                                      final user =
                                          await googleSignIn.signInWithGoogle();
                                      if (user != null) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            HomePage.routeName,
                                            (route) => false);
                                      } else {}
                                    },
                                    controller: _googleController,
                                    successColor: Colors.green,
                                    width: MediaQuery.of(context).size.width *
                                        0.50.w,
                                    elevation: 0,
                                    borderRadius: 25,
                                    color: Colors.white,
                                    child: const Wrap(children: [
                                      Icon(
                                        FontAwesomeIcons.google,
                                        size: 20,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 15),
                                      Text("Sign in with Google",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500))
                                    ])),
                          ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
