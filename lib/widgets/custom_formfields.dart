import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.value,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String hintText;
  final String label;
  final Icon icon;
  Function(String)? onChanged;
  final int value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: value,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(label,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 5, 78, 139))),
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 185, 10, 86))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 185, 10, 86)))),
      onChanged: onChanged,
    );
  }
}
