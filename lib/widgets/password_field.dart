import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/providers/password_provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required TextEditingController passwordController,
    required this.passwordProvider,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
  final PasswordProvider passwordProvider;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordProvider.isObscure,
      controller: _passwordController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Enter password',
        label: Text('Passowrd',
            style: TextStyle(
                fontSize: 16.sp, color: const Color.fromARGB(255, 5, 78, 139))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 185, 10, 86))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 185, 10, 86))),
        prefixIcon: const Icon(Icons.vpn_key, color: Colors.black),
        suffixIcon: IconButton(
          onPressed: () => passwordProvider.isToggleObscure(),
          icon: Icon(
            passwordProvider.isObscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          color: passwordProvider.isObscure ? Colors.black : Colors.red,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter passoword';
        } else if (value.length < 7) {
          return 'required eight digit passoword';
        } else if (value.length > 12) {
          return 'Please enter only twelve digit passoword';
        }
        return null;
      },
    );
  }
}
