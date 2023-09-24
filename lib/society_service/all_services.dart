import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = '/services';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 60.h,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 5, 78, 139),
        title: Text(
          'Servies',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/services.png"),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 05,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/cabling.png',
                                  fit: BoxFit.fill, height: 80.h, width: 100.w),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              children: [
                                Text('Cables Services',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/internet.png',
                                  fit: BoxFit.fill, height: 80.h, width: 100.w),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              children: [
                                Text('Internet Services',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == 2) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/plumber.png',
                                  fit: BoxFit.fill, height: 80.h, width: 100.w),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              children: [
                                Text('Plumber Services',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == 3) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                  'assets/images/electrician.png',
                                  fit: BoxFit.fill,
                                  height: 80.h,
                                  width: 100.w),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              children: [
                                Text('Electric Services',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == 4) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/cleaning.png',
                                  fit: BoxFit.fill, height: 80.h, width: 100.w),
                            ),
                            SizedBox(width: 10.h),
                            Column(
                              children: [
                                Text('Cleaner Services',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 185, 10, 86),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
