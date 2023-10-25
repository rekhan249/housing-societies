import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_model.dart';

class ServicesDetailsForUsers extends StatefulWidget {
  final String serviceId;
  final ServiceModel servicesDetailsForUsers;
  const ServicesDetailsForUsers(
      {super.key,
      required this.serviceId,
      required this.servicesDetailsForUsers});

  @override
  State<ServicesDetailsForUsers> createState() =>
      _ServicesDetailsForUsersState();
}

class _ServicesDetailsForUsersState extends State<ServicesDetailsForUsers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(widget.servicesDetailsForUsers.serviceTypes,
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
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.servicesDetailsForUsers.name,
                    style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold)),
                Text(widget.servicesDetailsForUsers.hourlyRate.toString(),
                    style: TextStyle(
                        color: const Color.fromRGBO(224, 224, 224, 1),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Text(widget.servicesDetailsForUsers.email,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold)),
            Text(widget.servicesDetailsForUsers.phoneNumber,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold)),
            Text(widget.servicesDetailsForUsers.address,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold)),
            Text(widget.servicesDetailsForUsers.desc,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ));
  }
}
