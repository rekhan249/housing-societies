import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CnicField extends StatelessWidget {
  const CnicField({
    super.key,
    required TextEditingController cniController,
  }) : _cniController = cniController;

  final TextEditingController _cniController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _cniController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.pin, color: Colors.black),
        hintText: 'Enter cnic no',
        label: Text('Cnic No',
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
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter cnic no';
        } else if (!RegExp(r'^(\d{13})$').hasMatch(value)) {
          return 'Please enter 13 digits valid cnic no';
        }
        return null;
      },
    );
  }
}
