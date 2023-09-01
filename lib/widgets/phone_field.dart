import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumField extends StatelessWidget {
  const PhoneNumField({
    super.key,
    required TextEditingController phoneNmbrController,
  }) : _phoneNmbrController = phoneNmbrController;

  final TextEditingController _phoneNmbrController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _phoneNmbrController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11)
      ],
      decoration: InputDecoration(
        hintText: 'Enter Phone number',
        label: Text('Phone no',
            style: TextStyle(
                fontSize: 16.sp, color: const Color.fromARGB(255, 5, 78, 139))),
        prefixIcon: const Icon(Icons.phone, color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 185, 10, 86))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                width: 3, color: Color.fromARGB(255, 185, 10, 86))),
      ),
    );
  }
}
