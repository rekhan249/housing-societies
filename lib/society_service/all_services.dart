import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/providers/requestprovider.dart';
import 'package:housing_society/society_service/services_detail_for_user.dart';
import 'package:provider/provider.dart';

class ServicesScreen extends StatefulWidget {
  static const String routeName = '/services';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<RequestProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 14, 53, 85)),
                child: Center(
                  child: Text("Services",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
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
                          padding:
                              EdgeInsets.only(left: 05.w, right: 05.w, top: 05),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<RequestProvider>(context,
                                      listen: false)
                                  .requestSubmission(context,
                                      servicesId: servicesData[index].id,
                                      servicesPro: ServiceModel(
                                        sid: servicesData[index]['sid'],
                                        name: servicesData[index]['name'],
                                        phoneNumber: servicesData[index]
                                            ['phoneNumber'],
                                        email: servicesData[index]['email'],
                                        address: servicesData[index]['address'],
                                        serviceTypes: servicesData[index]
                                            ['serviceTypes'],
                                        hourlyRate: servicesData[index]
                                            ['hourlyRate'],
                                        desc: servicesData[index]['desc'],
                                      ));
                            },
                            child: Card(
                              elevation: 3,
                              margin: EdgeInsets.only(left: 05.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/images/plumber.png',
                                      height: 65.h),
                                  Expanded(
                                      child: ListTile(
                                    title: Text(
                                        '${servicesData[index]['serviceTypes']}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 185, 10, 86))),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Charges:\$${servicesData[index]['hourlyRate']}'
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                        Text(
                                            'Ph # ${servicesData[index]['phoneNumber']}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )),
                                  IconButton(
                                    onPressed: () {
                                      ServicesDetailsForUsers(
                                          serviceId: servicesData[index].id,
                                          servicesDetailsForUsers: ServiceModel(
                                            sid: servicesData[index]['sid'],
                                            name: servicesData[index]['name'],
                                            phoneNumber: servicesData[index]
                                                ['phoneNumber'],
                                            email: servicesData[index]['email'],
                                            address: servicesData[index]
                                                ['address'],
                                            serviceTypes: servicesData[index]
                                                ['serviceTypes'],
                                            hourlyRate: servicesData[index]
                                                ['hourlyRate'],
                                            desc: servicesData[index]['desc'],
                                          ));
                                    },
                                    icon: const Row(
                                      children: [
                                        Text("Details"),
                                        Icon(Icons.arrow_forward),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
