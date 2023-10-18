import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/notification_services.dart/notifications.dart';
import 'package:housing_society/society_service/all_services.dart';
import 'package:housing_society/society_service/payment_method.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotifikationService notifikationService = NotifikationService();

  @override
  void initState() {
    notifikationService.reqstNotificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber.shade100,
        appBar: AppBar(
          toolbarHeight: 70.h,
          leading: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: CircleAvatar(
              child: Image.asset('assets/images/success.png'),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp)),
              SizedBox(width: 10.h),
              Text('03411234567',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp)),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 5, 78, 139),
          actions: [
            Row(
              children: [
                Container(
                    width: 100.w,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                              size: 25.sp, Icons.search, color: Colors.white)),
                    )),
                SizedBox(width: 10.w),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications,
                        size: 25.sp, color: Colors.white))
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Vistors',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 5, 78, 139),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: ListView.builder(
                    itemCount: 05,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CircleAvatar(
                        radius: 35.r,
                        child: Image.asset('assets/images/success.png'),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 05.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: Container(
                            height: 110.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.grey.shade300),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 50.w, top: 5.h),
                                  child: Text('01-Sept-2023',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.w, top: 05.h, bottom: 05.h),
                                  child: Text('Electricity Pay Due',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 21, 220, 28),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 80.w),
                                  child: Text('\$500',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 05.w),
                                  child: Text('Due Date 01-Sept-2023',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: Container(
                            height: 110.h,
                            width: 170.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.grey.shade200),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 50.w, top: 5.h),
                                  child: Text('01-Sept-2023',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 40.w, top: 05.h, bottom: 05.h),
                                  child: Text('My Complaint',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 21, 220, 28),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 05.w, right: 05.w),
                                  child: Text('Mataintenance - req to clear',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13.sp)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 05.h),
                                  child: Text('1 pending',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp)),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(width: 05.w)
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Feautres',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 5, 78, 139),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // if (index == 0) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //           color: const Color.fromARGB(255, 185, 10, 86),
                      //           elevation: 5,
                      //           child: CircleAvatar(
                      //             radius: 35.r,
                      //             child: Image.asset(
                      //               'assets/images/discovery.png',
                      //             ),
                      //           ),
                      //         ),
                      //         Text('Discovery',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // } else if (index == 1) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //             color: const Color.fromARGB(255, 185, 10, 86),
                      //             elevation: 5,
                      //             child: CircleAvatar(
                      //                 radius: 35.r,
                      //                 child: Image.asset(
                      //                     'assets/images/distributed.png'))),
                      //         Text('Distributed',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // } else if (index == 2) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //             color: const Color.fromARGB(255, 185, 10, 86),
                      //             elevation: 5,
                      //             child: CircleAvatar(
                      //                 radius: 35.r,
                      //                 child: Image.asset(
                      //                     'assets/images/explore.png'))),
                      //         Text('Explore',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // }
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ServicesScreen.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: const Color.fromARGB(255, 185, 10, 86),
                                  elevation: 5,
                                  child: CircleAvatar(
                                      radius: 60.r,
                                      child: Image.asset(
                                          'assets/images/service.png'))),
                              Text('Service',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 185, 10, 86),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      } else if (index == 1) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PaymentMethodology.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: const Color.fromARGB(255, 185, 10, 86),
                                  elevation: 5,
                                  child: CircleAvatar(
                                      radius: 60.r,
                                      child: Image.asset(
                                          'assets/images/debitcard.png'))),
                              Text('Debitcard',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 185, 10, 86),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'Quick Actions',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 5, 78, 139),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // if (index == 0) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //           color: const Color.fromARGB(255, 185, 10, 86),
                      //           elevation: 5,
                      //           child: CircleAvatar(
                      //             radius: 35.r,
                      //             child: Image.asset(
                      //               'assets/images/discovery.png',
                      //             ),
                      //           ),
                      //         ),
                      //         Text('Discovery',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // } else if (index == 1) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //             color: const Color.fromARGB(255, 185, 10, 86),
                      //             elevation: 5,
                      //             child: CircleAvatar(
                      //                 radius: 35.r,
                      //                 child: Image.asset(
                      //                     'assets/images/distributed.png'))),
                      //         Text('Distributed',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // } else if (index == 2) {
                      //   return GestureDetector(
                      //     onTap: () {},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Card(
                      //             color: const Color.fromARGB(255, 185, 10, 86),
                      //             elevation: 5,
                      //             child: CircleAvatar(
                      //                 radius: 35.r,
                      //                 child: Image.asset(
                      //                     'assets/images/explore.png'))),
                      //         Text('Explore',
                      //             style: TextStyle(
                      //                 color: const Color.fromARGB(
                      //                     255, 185, 10, 86),
                      //                 fontSize: 14.sp,
                      //                 fontWeight: FontWeight.bold))
                      //       ],
                      //     ),
                      //   );
                      // }
                      if (index == 0) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ServicesScreen.routeName);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: const Color.fromARGB(255, 185, 10, 86),
                                  elevation: 5,
                                  child: CircleAvatar(
                                      radius: 60.r,
                                      child: Image.asset(
                                          'assets/images/service.png'))),
                              Text('Service',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 185, 10, 86),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      } else if (index == 1) {
                        return GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                  color: const Color.fromARGB(255, 185, 10, 86),
                                  elevation: 5,
                                  child: CircleAvatar(
                                      radius: 60.r,
                                      child: Image.asset(
                                          'assets/images/debitcard.png'))),
                              Text('Debitcard',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 185, 10, 86),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
