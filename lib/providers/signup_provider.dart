import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/models/user_model.dart';
import 'package:housing_society/pages_screen/login_page.dart';

class SignUpProvider with ChangeNotifier {
  final firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  void onSubmittedSignUpForm(BuildContext context, final userName, final email,
      final phoneNumber, final password, selectedValue) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      sendDataToFireBase(userName, email, phoneNumber, password, selectedValue);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  void sendDataToFireBase(
      userName, email, phoneNumber, password, selectedValue) async {
    UserModel? userModel = UserModel(
        uid: _auth.currentUser!.uid,
        userName: userName,
        phoneNum: phoneNumber,
        email: email,
        password: password,
        userType: selectedValue);
    await firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Create Successfully");
  }
}
