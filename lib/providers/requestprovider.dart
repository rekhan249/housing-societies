// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/models/services_model.dart';
import 'package:housing_society/models/services_request_model.dart';

class RequestProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isRequestPending = false;

  void requestSubmission(BuildContext context,
      {required String servicesId, required ServiceModel servicesPro}) async {
    User? user = _auth.currentUser;
    isRequestPending = false;
    ServicesRequest servicesRequest = ServicesRequest(
        uId: user!.uid,
        userEmail: user.email!,
        serviceType: servicesPro.serviceTypes,
        isApproved: false,
        isReserved: false,
        isReservedAt: DateTime.now(),
        timestamp: DateTime.now(),
        sId: servicesPro.sid);
    await _firestore
        .collection("requestServices")
        .doc(_auth.currentUser!.uid)
        .set(servicesRequest.toMap());
    isRequestPending = true;
    Fluttertoast.showToast(
        msg: "$isRequestPending Request Sucesssfully Submitted");
  }
}

class ApprovedRequest with ChangeNotifier {
  void approvedRequest(BuildContext context,
      {required String idValue,
      required bool isRequestPending,
      required isApproved,
      required isReserved}) async {
    isRequestPending;
    final CollectionReference studentCollection =
        FirebaseFirestore.instance.collection('requestServices');
    await studentCollection.doc(idValue).update({
      "isApproved": !(isApproved),
      "isReserved": !(isReserved),
    });
    isRequestPending = false;

    Fluttertoast.showToast(
        msg:
            "$isRequestPending Admin Approved Request and Reserved Sucesssfully");
  }
}
