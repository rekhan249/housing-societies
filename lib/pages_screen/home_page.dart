import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/society_service/all_services.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        toolbarHeight: 80.h,
        leading: Row(
          children: [
            // SizedBox(width: 10.w),
            // CircleAvatar(
            //   radius: 25.r,
            //   child: Image.asset('assets/images/success.png'),
            // ),
            // SizedBox(width: 10.w),
            // const Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Name', style: TextStyle(color: Colors.white)),
            //     Text('03411234567', style: TextStyle(color: Colors.white)),
            //   ],
            // ),
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
                    decoration: const InputDecoration(
                        suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                  )),
              SizedBox(width: 10.w),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications, color: Colors.white)),
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
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                        height: 90.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.teal),
                        child: Column(
                          children: [
                            Text('01-Sept-2023',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp)),
                            Text('Electricity Pay Due',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 21, 220, 28),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                            Text('\$500',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp)),
                            Text('Due Date 01-Sept-2023',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                          ],
                        )),
                  ),
                  SizedBox(width: 10.w),
                  Card(
                    elevation: 4,
                    child: Container(
                        height: 90.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.grey.shade500),
                        child: Column(
                          children: [
                            Text('01-Sept-2023',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp)),
                            Text('My Complaint',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 21, 220, 28),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                            Text('Mataintenance - req to clear',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.sp)),
                            Text('1 pending',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                          ],
                        )),
                  ),
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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: ListView.builder(
                  itemCount: 05,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: const Color.fromARGB(255, 185, 10, 86),
                              elevation: 5,
                              child: CircleAvatar(
                                radius: 40.r,
                                child: Image.asset(
                                  'assets/images/discovery.png',
                                ),
                              ),
                            ),
                            Text('Discovery',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
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
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/distributed.png'))),
                            Text('Distributed',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 2) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/explore.png'))),
                            Text('Explore',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 3) {
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
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/service.png'))),
                            Text('Service',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 4) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/debitcard.png'))),
                            Text('Debitcard',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                height: 110.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: ListView.builder(
                  itemCount: 05,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/discovery.png'))),
                            Text('Discovery',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
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
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/distributed.png'))),
                            Text('Distributed',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 2) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/explore.png'))),
                            Text('Explore',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 3) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/service.png'))),
                            Text('Service',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      );
                    } else if (index == 4) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                                color: const Color.fromARGB(255, 185, 10, 86),
                                elevation: 5,
                                child: CircleAvatar(
                                    radius: 40.r,
                                    child: Image.asset(
                                        'assets/images/debitcard.png'))),
                            Text('Debitcard',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 185, 10, 86),
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
    );
  }
}
