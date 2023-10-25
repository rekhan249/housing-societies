import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:housing_society/providers/requestprovider.dart';
import 'package:provider/provider.dart';

class AllPendingRequests extends StatefulWidget {
  static const String routeName = '/pending-request';
  final bool isRequestPending;
  const AllPendingRequests({super.key, required this.isRequestPending});

  @override
  State<AllPendingRequests> createState() => _AllPendingRequestsState();
}

class _AllPendingRequestsState extends State<AllPendingRequests> {
  bool isValue = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<ApprovedRequest>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Pending Requests',
            style: TextStyle(color: Colors.white, fontSize: 18.sp)),
        backgroundColor: const Color.fromARGB(255, 14, 53, 85),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('requestServices')
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                          'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
                                          width: 60.w)),
                                  title: Text(
                                      servicesData[index]["serviceType"]
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      servicesData[index]["userEmail"]
                                          .toString(),
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
                                      if (servicesData[index].exists &&
                                          isValue == true) {
                                        Provider.of<ApprovedRequest>(context,
                                                listen: false)
                                            .approvedRequest(context,
                                                idValue: servicesData[index].id,
                                                isApproved: servicesData[index]
                                                    ['isApproved'],
                                                isReserved: servicesData[index]
                                                    ['isReserved'],
                                                isRequestPending:
                                                    widget.isRequestPending);
                                        isValue = false;
                                      }
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 3, 70, 125),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                        child: Text("Approve &\n Reserved",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 08.sp)),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      studentDeletion(servicesData[index].id);
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 3, 70, 125),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: const Icon(Icons.delete_forever,
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
          ],
        ),
      ),
    ));
  }

  Future<void> studentDeletion(String id) async {
    CollectionReference cR =
        FirebaseFirestore.instance.collection('requestServices');
    await cR.doc(id).delete();
  }
}
