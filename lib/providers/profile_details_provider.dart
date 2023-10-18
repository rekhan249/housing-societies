import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/bottom_nav/bottom_nav_user.dart';
import 'package:housing_society/models/profile_model.dart';

class ProfileDetailProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  void profileDetailsForm(
    BuildContext context,
    final nameController,
    final phoneNmbrController,
    final cniController,
    final dateController,
    final addressController,
    final selectedGender,
    final selectedCountry,
    final selectedCity,
    Uint8List profile,
  ) async {
    String dowloadUrl = '';
    final Reference firebaseStorage = FirebaseStorage.instance
        .ref('profile')
        .child(FirebaseAuth.instance.currentUser!.uid);
    final TaskSnapshot uploadTask = await firebaseStorage.putData(
        profile, SettableMetadata(contentType: "image/jpeg"));
    dowloadUrl = await uploadTask.ref.getDownloadURL();
    ProfileModel? profileModel;

    profileModel = ProfileModel(
        pid: _auth.currentUser!.uid,
        userName: nameController,
        email: _auth.currentUser!.email!,
        phoneNum: phoneNmbrController,
        cnic: cniController,
        age: dateController,
        gender: selectedGender,
        address: addressController,
        city: selectedCity,
        county: selectedCountry,
        profilePic: Uint8List.fromList(utf8.encode(dowloadUrl)));

    /* -------------------------------------------------------- */
    /// for deconding and back to string from Uini8List
    ///   String convertedString = utf8.decode(bytes);
/* -------------------------------------------------------- */
    if (profileModel.profilePic.isEmpty) {
      Fluttertoast.showToast(msg: "Image is Required");
    } else {
      _firestore
          .collection('profile')
          .doc(_auth.currentUser!.uid)
          .set(profileModel.toMap())
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavUser()),
            (Route<dynamic> route) => false);
        Fluttertoast.showToast(msg: "Save User Successfully");
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
