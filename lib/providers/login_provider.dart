// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/pages_screen/home_page.dart';

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
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
        Fluttertoast.showToast(msg: 'Login Successfully');
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
