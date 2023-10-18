import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateServices extends StatefulWidget {
  static const routeName = "/update-services";
  const UpdateServices({super.key});

  @override
  State<UpdateServices> createState() => _UpdateServicesState();
}

class _UpdateServicesState extends State<UpdateServices> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                height: 40.h,
                width: double.infinity.w,
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: Center(
                  child: Text("Service Updation",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 14, 53, 85),
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.data == null) {
                    return const Center(child: Text(" Data Doesn't exist"));
                  }
                  final servicesData = snapshot.data!.docs;
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, right: 5.w, bottom: 20, top: 10),
                          child: Card(
                            elevation: 5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                      'assets/images/plumber.png',
                                      height: 120.h,
                                      width: 100.w),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 05.w, bottom: 10.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              servicesData[index]
                                                  ['serviceTypes'],
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 185, 10, 86))),
                                          SizedBox(width: 20.w),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                  '\$${servicesData[index]['hourlyRate']}'
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black))),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.edit,
                                                  color: Colors.black,
                                                  size: 20.sp))
                                        ],
                                      ),
                                      Text(
                                          'Ph # ${servicesData[index]['phoneNumber']}',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                      SizedBox(height: 02.h),
                                      Container(
                                        color: Colors.transparent,
                                        width: 200,
                                        child: Text(
                                            '${servicesData[index]['address']}',
                                            softWrap: true,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                      ),
                                      SizedBox(height: 02.h),
                                      Container(
                                        color: Colors.transparent,
                                        width: 220,
                                        child: Text(
                                            '${servicesData[index]['desc']}',
                                            softWrap: true,
                                            maxLines: 3,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
