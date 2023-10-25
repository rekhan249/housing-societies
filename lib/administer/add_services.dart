import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/administer/update_services.dart';
import 'package:housing_society/providers/addservices_provide.dart';
import 'package:housing_society/widgets/custom_formfields.dart';
import 'package:housing_society/widgets/email_field.dart';
import 'package:housing_society/widgets/name_field.dart';
import 'package:housing_society/widgets/phone_field.dart';
import 'package:provider/provider.dart';

class AddServices extends StatefulWidget {
  static const routeName = "/add-sevices";
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  final _formKey = GlobalKey<FormState>();
  final _servicesIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNmbrController = TextEditingController();
  final _addressController = TextEditingController();
  final _typeServicesProviderController = TextEditingController();
  final _descController = TextEditingController();
  final _hourlyChargedController = TextEditingController();

  void _submitServiceDetailsForm(BuildContext context) {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<AddServicesProvider>(context, listen: false).AddServicesForm(
        context,
        _nameController.text.trim(),
        _phoneNmbrController.text.trim(),
        _emailController.text.trim(),
        _addressController.text.trim(),
        _typeServicesProviderController.text.trim(),
        _hourlyChargedController.text.trim(),
        // Provider.of<GalleryImageProvider>(context, listen: false).profile,
        _servicesIdController.text.trim(),
        _descController.text.trim());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNmbrController.dispose();
    _emailController.dispose();
    _phoneNmbrController.dispose();
    _hourlyChargedController.dispose();
    _addressController.dispose();
    _servicesIdController.dispose();
    _typeServicesProviderController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<GalleryImageProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  height: 35.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Center(
                    child: Text("Add Service",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 14, 53, 85),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 15.h),
                // Center(
                //     child: Consumer<GalleryImageProvider>(
                //         builder: (context, gIP, child) => GestureDetector(
                //             onTap: () async {
                //               await gIP.uploadImage();
                //             },
                //             child: Container(
                //                 child: gIP.profile == null
                //                     ? CircleAvatar(
                //                         radius: 65.h,
                //                         child: Image.asset(
                //                             'assets/images/success.png'))
                //                     : CircleAvatar(
                //                         radius: 65.h,
                //                         backgroundImage:
                //                             MemoryImage(gIP.profile!)))))),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  controller: _servicesIdController,
                  hintText: 'Enter Services Id',
                  label: 'Services ID',
                  icon: const Icon(
                    Icons.numbers,
                    color: Colors.black,
                  ),
                  onChanged: (String value) {},
                  value: 1,
                ),
                SizedBox(height: 15.h),
                NameField(nameController: _nameController),
                SizedBox(height: 15.h),
                EmailField(emailController: _emailController),
                SizedBox(height: 15.h),
                PhoneNumField(phoneNmbrController: _phoneNmbrController),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  controller: _addressController,
                  hintText: 'Enter Address here',
                  label: 'Address',
                  icon: const Icon(
                    Icons.add_home,
                    color: Colors.black,
                  ),
                  onChanged: (String value) {},
                  value: 2,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  controller: _typeServicesProviderController,
                  hintText: 'Enter Services Provided',
                  label: 'Services Types',
                  icon: const Icon(
                    Icons.miscellaneous_services,
                    color: Colors.black,
                  ),
                  onChanged: (String value) {},
                  value: 1,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  controller: _hourlyChargedController,
                  hintText: 'Enter rupees per hour',
                  label: 'Charges',
                  icon: const Icon(
                    Icons.price_change,
                    color: Colors.black,
                  ),
                  onChanged: (String value) {},
                  value: 1,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  controller: _descController,
                  hintText: 'Enter brief description',
                  label: 'About Us',
                  icon: const Icon(
                    Icons.price_change,
                    color: Colors.black,
                  ),
                  onChanged: (String value) {},
                  value: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(08.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 56.h,
                          width: 145.w,
                          child: TextButton(
                              onPressed: () =>
                                  _submitServiceDetailsForm(context),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 2, 47, 69))),
                              child: Text('Add Service',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)))),
                      SizedBox(
                          height: 56.h,
                          width: 145.w,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UpdateServices.routeName);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 2, 47, 69))),
                              child: Text('Update Services',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
