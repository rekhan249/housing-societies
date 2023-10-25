import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/user_model.dart';

class UsersDetails extends StatefulWidget {
  final String userId;
  final UserModel userDetails;
  const UsersDetails(
      {super.key, required this.userId, required this.userDetails});

  @override
  State<UsersDetails> createState() => _UsersDetailsState();
}

class _UsersDetailsState extends State<UsersDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(
              widget.userDetails.userType.values.elementAt(1).toString(),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 05.h),
              Text('Name: ${widget.userDetails.userName}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 05.h),
              Text('Email: ${widget.userDetails.email}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 05.h),
              Text('Phone number: ${widget.userDetails.phoneNum}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  )),
              SizedBox(height: 05.h),
              Text(
                  'UserType: ${widget.userDetails.userType.values.elementAt(1)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
