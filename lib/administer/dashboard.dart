import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/administer/users_availer/all_aproved_req.dart';
import 'package:housing_society/administer/users_availer/all_pending_req.dart';
import 'package:housing_society/administer/users_availer/all_user_availers.dart';
import 'package:housing_society/society_service/service_providers.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Container(
                  height: 35.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  child: Center(
                    child: Text("Dashboard",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 14, 53, 85),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 05, top: 05),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllServiceAvailers(screenId: index)));
                            },
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(height: 05.h),
                                    CircleAvatar(
                                        radius: 45.r,
                                        child: Image.asset(
                                            "assets/images/users.png")),
                                    Text("Users",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text("(Services Availer)",
                                        style: TextStyle(fontSize: 15.sp)),
                                  ],
                                )),
                          ),
                        ),
                      );
                    } else if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 05, top: 05),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ServiceProviders(screenId: index)));
                            },
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.h),
                                    CircleAvatar(
                                      radius: 45.r,
                                      child: Image.asset(
                                          "assets/images/serviceprovider.png"),
                                    ),
                                    Text("Users",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 03.h),
                                    Text("(Services Provider)",
                                        style: TextStyle(fontSize: 15.sp)),
                                  ],
                                )),
                          ),
                        ),
                      );
                    } else if (index == 2) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 05, top: 05),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllPendingRequests(
                                              isRequestPending: true)));
                            },
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(height: 05.h),
                                    CircleAvatar(
                                      radius: 45.r,
                                      child: Image.asset(
                                          "assets/images/users.png"),
                                    ),
                                    Text("Users",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text("(Availer)",
                                        style: TextStyle(fontSize: 16.sp)),
                                  ],
                                )),
                          ),
                        ),
                      );
                    } else if (index == 3) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 05, top: 05),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllAprovedRequset(
                                              isRequestPending: true)));
                            },
                            child: Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(height: 05.h),
                                    CircleAvatar(
                                      radius: 45.r,
                                      child: Image.asset(
                                          "assets/images/users.png"),
                                    ),
                                    Text("Users",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold)),
                                    Text("(Availer)",
                                        style: TextStyle(fontSize: 16.sp)),
                                  ],
                                )),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
