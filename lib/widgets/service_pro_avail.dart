import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesProviderOrAvailer extends StatelessWidget {
  const ServicesProviderOrAvailer({
    super.key,
    required TextEditingController availOrProviderServiceController,
  }) : _availOrProviderServiceController = availOrProviderServiceController;

  final TextEditingController _availOrProviderServiceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _availOrProviderServiceController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person_search,
          color: Colors.black,
        ),
        hintText: 'Enter user type  here',
        label: Text('Service Provider or Service Avail',
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
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return 'Please enter types name';
        } else if (!RegExp(r"^[a-zA-Z]+(?:\s[a-zA-Z]+)+$").hasMatch(value)) {
          return 'Please enter valid types name';
        }
        return null;
      }),
    );
  }
}
