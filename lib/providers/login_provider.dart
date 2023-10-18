// ignore_for_file: unrelated_type_equality_checks
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/bottom_nav/bottom_nav_services.dart';
import 'package:housing_society/models/radio_model.dart';
import 'package:housing_society/pages_screen/profile_details.dart';

class LoginProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  void inLoginForm(BuildContext context, final email, final password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {
        ServiceProAvail services =
            ServiceProAvail.fromMap(value.data()!['userType']);
        if (services.id == 1 && services.title == "Services Provider") {
          Navigator.of(context).pushNamedAndRemoveUntil(
              BottomNavServices.routeName, (route) => false);
          Fluttertoast.showToast(msg: 'Login Successfully');
        } else if (services.id == 2 && services.title == "Services Avail") {
          Navigator.of(context).pushNamedAndRemoveUntil(
              ProfileDetails.routeName, (route) => false);
          Fluttertoast.showToast(msg: 'Login Successfully');
        } else {
          return;
        }
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
