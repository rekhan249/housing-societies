import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/radio_model.dart';
import 'package:housing_society/pages_screen/login_page.dart';
import 'package:housing_society/providers/password_provider.dart';
import 'package:housing_society/providers/serviceProAvail_provider.dart';
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
        Provider.of<ServiceProAvailProvider>(context, listen: false)
            .selectedValue!
            .toMap());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNmbrController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    Provider.of<ServiceProAvailProvider>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var passwordProvider =
        Provider.of<PasswordProvider>(context, listen: false);
    Provider.of<ServiceProAvailProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 35, right: 35, bottom: 10, top: 10),
              child: ListView(
                children: [
                  SizedBox(height: 10.h),
                  Center(
                      child: Image(
                          image: const AssetImage("assets/images/society.jfif"),
                          height: 200.h,
                          width: 300.w)),
                  Center(
                      child: Text('Create Account Here',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 5, 78, 139)))),
                  SizedBox(height: 15.h),
                  NameField(nameController: _nameController),
                  for (final option in serviceProAvail)
                    Consumer<ServiceProAvailProvider>(
                      builder: (context, availPro, child) => ListTile(
                        title: Text(option.title),
                        leading: Radio(
                          value: option,
                          groupValue: availPro.selectedValue,
                          onChanged: (value) {
                            availPro.setSelectedRadioTile(value);
                          },
                        ),
                      ),
                    ),
                  PhoneNumField(phoneNmbrController: _phoneNmbrController),
                  SizedBox(height: 15.h),
                  EmailField(emailController: _emailController),
                  SizedBox(height: 15.h),
                  Consumer<PasswordProvider>(
                      builder: ((context, pp, child) => PasswordField(
                          passwordController: _passwordController,
                          passwordProvider: passwordProvider))),
                  SizedBox(height: 15.h),
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

final List<ServiceProAvail> serviceProAvail = [
  ServiceProAvail(id: 1, title: "Services Provider"),
  ServiceProAvail(id: 2, title: "Services Avail")
];
