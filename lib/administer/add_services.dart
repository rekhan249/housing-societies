import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/providers/addservices_provide.dart';
import 'package:housing_society/providers/profile_pic_provider.dart';
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
        _nameController.text,
        _phoneNmbrController.text,
        _emailController.text,
        _addressController.text,
        _typeServicesProviderController.text,
        _hourlyChargedController.text,
        Provider.of<GalleryImageProvider>(context, listen: false).profile,
        _servicesIdController.text,
        _descController.text);
  }

  @override
  void dispose() {
    _nameController.clear();
    _phoneNmbrController.clear();
    _emailController.clear();
    _phoneNmbrController.clear();
    _hourlyChargedController.clear();
    _addressController.clear();
    _servicesIdController.clear();
    _typeServicesProviderController.clear();
    _descController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GalleryImageProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  height: 40.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Center(
                    child: Text("Add Service",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 14, 53, 85),
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                    child: Consumer<GalleryImageProvider>(
                        builder: (context, gIP, child) => GestureDetector(
                            onTap: () async {
                              await gIP.uploadImage();
                            },
                            child: Container(
                                child: gIP.profile == null
                                    ? CircleAvatar(
                                        radius: 65.h,
                                        child: Image.asset(
                                            'assets/images/success.png'))
                                    : CircleAvatar(
                                        radius: 65.h,
                                        backgroundImage:
                                            MemoryImage(gIP.profile!)))))),
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
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      height: 56.h,
                      width: double.infinity.w,
                      child: TextButton(
                          onPressed: () => _submitServiceDetailsForm(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 185, 10, 86))),
                          child: Text('Add Service',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
