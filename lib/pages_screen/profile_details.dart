import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/providers/date_provider.dart';
import 'package:housing_society/providers/dropdown_provider.dart';
import 'package:housing_society/providers/profile_details_provider.dart';
import 'package:housing_society/providers/profile_pic_provider.dart';
import 'package:housing_society/widgets/cnic_field.dart';
import 'package:housing_society/widgets/name_field.dart';
import 'package:housing_society/widgets/phone_field.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatefulWidget {
  static const String routeName = 'profile-page';
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNmbrController = TextEditingController();
  final _cniController = TextEditingController();
  final _dateController = TextEditingController();
  final _addressController = TextEditingController();

  void _submitProfileDetailsForm(BuildContext context) {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<ProfileDetailProvider>(context, listen: false)
        .profileDetailsForm(
      context,
      _nameController.text,
      _phoneNmbrController.text,
      _cniController.text,
      _dateController.text,
      _addressController.text,
      Provider.of<GenderDropDownProvider>(context, listen: false)
          .selectedGender,
      Provider.of<CityCountryDropDownProvider>(context, listen: false)
          .selectedCountry,
      Provider.of<CityCountryDropDownProvider>(context, listen: false)
          .selectedCity,
      Provider.of<GalleryImageProvider>(context, listen: false).profile,
    );
  }

  @override
  void dispose() {
    _nameController.clear();
    _phoneNmbrController.clear();
    _cniController.clear();
    _dateController.clear();
    _addressController.clear();

    super.dispose();
    Provider.of<GenderDropDownProvider>(context, listen: false).dispose();
    Provider.of<CityCountryDropDownProvider>(context, listen: false).dispose();
    Provider.of<CityCountryDropDownProvider>(context, listen: false).dispose();
    Provider.of<GalleryImageProvider>(context, listen: false).dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GalleryImageProvider>(context, listen: false);
    Provider.of<DateProvider>(context, listen: false);
    final gender = Provider.of<GenderDropDownProvider>(context, listen: false);
    final city =
        Provider.of<CityCountryDropDownProvider>(context, listen: false);
    final country =
        Provider.of<CityCountryDropDownProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber.shade100,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                      child: Text('Profile Detail',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 5, 78, 139),
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold))),
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
                  SizedBox(height: 20.h),
                  NameField(nameController: _nameController),
                  SizedBox(height: 20.h),
                  PhoneNumField(phoneNmbrController: _phoneNmbrController),
                  SizedBox(height: 20.h),
                  CnicField(cniController: _cniController),
                  SizedBox(height: 20.h),
                  Consumer<DateProvider>(
                    builder: (context, dP, child) => TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () async {
                        _dateController.text = (await dP.selectDate(context))!;
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        labelStyle: TextStyle(
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 5, 78, 139)),
                        prefixIcon: const Icon(Icons.pin, color: Colors.black),
                        suffixIcon: const Icon(Icons.calendar_today,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Consumer<GenderDropDownProvider>(
                    builder: (context, gDP, child) =>
                        DropdownButtonFormField<String>(
                      value: gender.selectedGender,
                      items:
                          gender.genderList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        gender.selectGender(value!);
                      },
                      validator: (value) {
                        value == null ? 'select Gender' : null;
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person_3, color: Colors.black),
                        hintText: "Choose Gender",
                        label: Text('Gender',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 5, 78, 139),
                                fontSize: 14.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    controller: _addressController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.home, color: Colors.black),
                      hintText: "Enter Address here",
                      hintStyle: const TextStyle(color: Colors.black),
                      label: Text('Address',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 5, 78, 139),
                              fontSize: 14.sp)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 185, 10, 86))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 185, 10, 86))),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Consumer<CityCountryDropDownProvider>(
                    builder: (context, cDP, child) =>
                        DropdownButtonFormField<String?>(
                      value: country.selectedCountry,
                      items: country.selectedDesireCities.keys
                          .map<DropdownMenuItem<String?>>((e) {
                        return DropdownMenuItem<String?>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        country.selectCountry(value!);
                      },
                      validator: (value) {
                        value == null ? 'select Country' : null;
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person_3, color: Colors.black),
                        hintText: "Choose Country",
                        hintStyle: const TextStyle(color: Colors.black),
                        label: Text('Country',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 5, 78, 139),
                                fontSize: 14.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Consumer<CityCountryDropDownProvider>(
                    builder: (context, cDP, child) =>
                        DropdownButtonFormField<String?>(
                      value: city.selectedCity,
                      items: (city.selectedDesireCities[city.selectedCountry] ??
                              [])
                          .map<DropdownMenuItem<String?>>((e) {
                        return DropdownMenuItem<String?>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        city.selectCity(value!);
                      },
                      validator: (value) {
                        value == null ? 'select City' : null;
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.person_3, color: Colors.black),
                        hintText: "Choose City",
                        hintStyle: const TextStyle(color: Colors.black),
                        label: Text('City',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 5, 78, 139),
                                fontSize: 14.sp)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 185, 10, 86))),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                      height: 56.h,
                      width: double.infinity.w,
                      child: TextButton(
                          onPressed: () => _submitProfileDetailsForm(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 185, 10, 86))),
                          child: Text('Create',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
