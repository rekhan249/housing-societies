import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/society_service/services_detail.dart';

class ServiceProviders extends StatefulWidget {
  final int screenId;
  const ServiceProviders({super.key, required this.screenId});

  @override
  State<ServiceProviders> createState() => _ServiceProvidersState();
}

class _ServiceProvidersState extends State<ServiceProviders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text("Service Providers",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 05.w),
              child: StreamBuilder(
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0.w, vertical: 10.h),
                          child: Container(
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
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.network(
                                            'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
                                            width: 60.w)),
                                    title: Text(
                                        servicesData[index]["serviceTypes"]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        servicesData[index]["name"].toString(),
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 2, 47, 69),
                                            fontSize: 14.sp)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        productDeletion(servicesData[index].id);
                                      },
                                      child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 3, 70, 125),
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: const Center(
                                          child: Icon(Icons.delete_forever,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ServicesDetails(
                                                        serviceId:
                                                            servicesData[index]
                                                                .id,
                                                        servicesDetails:
                                                            ServiceModel(
                                                          sid: servicesData[
                                                              index]['sid'],
                                                          name: servicesData[
                                                              index]['name'],
                                                          phoneNumber:
                                                              servicesData[
                                                                      index][
                                                                  'phoneNumber'],
                                                          email: servicesData[
                                                              index]['email'],
                                                          address: servicesData[
                                                              index]['address'],
                                                          serviceTypes:
                                                              servicesData[
                                                                      index][
                                                                  'serviceTypes'],
                                                          hourlyRate:
                                                              servicesData[
                                                                      index][
                                                                  'hourlyRate'],
                                                          desc: servicesData[
                                                              index]['desc'],
                                                        ))));
                                      },
                                      child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 3, 70, 125),
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: const Icon(Icons.arrow_forward,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> productDeletion(String id) async {
    CollectionReference cR = FirebaseFirestore.instance.collection('sevices');
    await cR.doc(id).delete();
  }
}
