import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/pages_screen/login_page.dart';
import 'package:housing_society/providers/password_provider.dart';
import 'package:housing_society/providers/signup_provider.dart';
import 'package:housing_society/widgets/email_field.dart';
import 'package:housing_society/widgets/name_field.dart';
import 'package:housing_society/widgets/password_field.dart';
import 'package:housing_society/widgets/phone_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup-page';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNmbrController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitSignUpForm(BuildContext context) {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<SignUpProvider>(context, listen: false).onSubmittedSignUpForm(
      context,
      _nameController.text.trim(),
      _emailController.text.trim(),
      _phoneNmbrController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNmbrController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              child: ListView(
                children: [
                  SizedBox(height: 80.h),
                  Center(
                      child: Text('Create Account Here',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 5, 78, 139)))),
                  SizedBox(height: 20.h),
                  NameField(nameController: _nameController),
                  SizedBox(height: 20.h),
                  PhoneNumField(phoneNmbrController: _phoneNmbrController),
                  SizedBox(height: 20.h),
                  EmailField(emailController: _emailController),
                  SizedBox(height: 20.h),
                  Consumer<PasswordProvider>(
                      builder: ((context, pp, child) => PasswordField(
                          passwordController: _passwordController,
                          passwordProvider: passwordProvider))),
                  SizedBox(height: 20.h),
                  SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            _submitSignUpForm(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 185, 10, 86))),
                          child: Text('Sign Up',
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
                                text: 'Already have an account? ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp)),
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage())))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}