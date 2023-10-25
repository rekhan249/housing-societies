import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_model.dart';

class ServicesDetails extends StatefulWidget {
  final ServiceModel servicesDetails;
  final String serviceId;
  const ServicesDetails(
      {super.key, required this.servicesDetails, required this.serviceId});

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(widget.servicesDetails.serviceTypes,
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 14, 53, 85),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.servicesDetails.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold)),
                  Text(widget.servicesDetails.hourlyRate.toString(),
                      style: TextStyle(
                          color: const Color.fromRGBO(224, 224, 224, 1),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(widget.servicesDetails.email,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              Text(widget.servicesDetails.phoneNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              Text(widget.servicesDetails.address,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
              Text(widget.servicesDetails.desc,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ));
  }
}
