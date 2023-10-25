import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/providers/update_services.dart';
import 'package:housing_society/widgets/custom_formfields.dart';
import 'package:housing_society/widgets/email_field.dart';
import 'package:housing_society/widgets/name_field.dart';
import 'package:housing_society/widgets/phone_field.dart';
import 'package:provider/provider.dart';

class UpdateServices extends StatefulWidget {
  static const routeName = "/update-sevices";
  final String serviceId;
  final ServiceModel servicesData;
  const UpdateServices(
      {super.key, required this.serviceId, required this.servicesData});

  @override
  State<UpdateServices> createState() => _UpdateServicesState();
}

class _UpdateServicesState extends State<UpdateServices> {
  final _formKey = GlobalKey<FormState>();
  final _servicesIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNmbrController = TextEditingController();
  final _addressController = TextEditingController();
  final _typeServicesProviderController = TextEditingController();
  final _descController = TextEditingController();
  final _hourlyChargedController = TextEditingController();

  @override
  void initState() {
    _servicesIdController.text = widget.servicesData.sid;
    _nameController.text = widget.servicesData.name;
    _emailController.text = widget.servicesData.email;
    _phoneNmbrController.text = widget.servicesData.phoneNumber;
    _addressController.text = widget.servicesData.address;
    _typeServicesProviderController.text = widget.servicesData.serviceTypes;
    _descController.text = widget.servicesData.desc;
    _hourlyChargedController.text = widget.servicesData.hourlyRate.toString();
    super.initState();
  }

  void _submitServiceDetailsForm(BuildContext context) {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<UpdateServicesProvider>(context, listen: false)
        .updateServicesForm(
      context,
      _nameController.text.trim(),
      _phoneNmbrController.text.trim(),
      _emailController.text.trim(),
      _addressController.text.trim(),
      _typeServicesProviderController.text.trim(),
      _hourlyChargedController.text.trim(),
      // Provider.of<GalleryImageProvider>(context, listen: false).profile,
      _servicesIdController.text.trim(),
      _descController.text.trim(),
      widget.serviceId,
    );
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
                    child: Text("Update Service",
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
                  child: SizedBox(
                      height: 56.h,
                      width: double.infinity.w,
                      child: TextButton(
                          onPressed: () => _submitServiceDetailsForm(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 2, 47, 69))),
                          child: Text('Update Services',
                              style: TextStyle(
                                  fontSize: 16.sp,
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
