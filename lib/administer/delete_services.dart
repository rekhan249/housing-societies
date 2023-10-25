import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/administer/update_services.dart';
import 'package:housing_society/models/services_model.dart';

class DeletedServices extends StatefulWidget {
  static const routeName = "/delete-sevices";
  const DeletedServices({super.key});

  @override
  State<DeletedServices> createState() => _DeletedServicesState();
}

class _DeletedServicesState extends State<DeletedServices> {
  bool isValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(height: 05.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    height: 35.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Center(
                      child: Text("Service Updation",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 14, 53, 85),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                    ),
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
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 05.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 05.h),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: const Offset(0, 4),
                                    blurRadius: 10.0)
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                            'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
                                            width: 70.w)),
                                    title: Text(
                                        servicesData[index]["serviceTypes"]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            servicesData[index]["hourlyRate"]
                                                .toString(),
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 2, 47, 69),
                                                fontSize: 14.sp)),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => UpdateServices(
                                                    serviceId:
                                                        servicesData[index].id,
                                                    servicesData: ServiceModel(
                                                        sid: servicesData[index]
                                                            ['sid'],
                                                        name:
                                                            servicesData[index]
                                                                ['name'],
                                                        phoneNumber: servicesData[index]
                                                            ['phoneNumber'],
                                                        email: servicesData[index]
                                                            ['email'],
                                                        address:
                                                            servicesData[index]
                                                                ['address'],
                                                        serviceTypes: servicesData[index]
                                                            ['serviceTypes'],
                                                        hourlyRate:
                                                            servicesData[index]
                                                                ['hourlyRate'],
                                                        desc:
                                                            servicesData[index]
                                                                ['desc'])),
                                              ));
                                        },
                                        child: const Icon(Icons.edit,
                                            color: Color.fromARGB(
                                                255, 3, 70, 125))),
                                    TextButton(
                                        onPressed: () {
                                          productDeletion(
                                              servicesData[index].id);
                                        },
                                        child: const Icon(Icons.delete_forever,
                                            color: Color.fromARGB(
                                                255, 3, 70, 125))),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> productDeletion(String id) async {
    CollectionReference cR = FirebaseFirestore.instance.collection('sevices');
    await cR.doc(id).delete();
  }
}
