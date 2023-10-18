import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housing_society/administer/dashboard.dart';
import 'package:housing_society/models/services_model.dart';

class AddServicesProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  void AddServicesForm(
      BuildContext context,
      final nameController,
      final phoneNmbrController,
      final emailController,
      final addressController,
      final serviceTypes,
      final hourlyChargedController,
      Uint8List profile,
      final servicesIdController,
      final descController) async {
    String dowloadUrl = '';
    final Reference firebaseStorage =
        FirebaseStorage.instance.ref('services').child('servicePathOfThePics');
    final TaskSnapshot uploadTask = await firebaseStorage.putData(
        profile, SettableMetadata(contentType: "image/jpeg"));
    dowloadUrl = await uploadTask.ref.getDownloadURL();
    ServiceModel? serviceModel = ServiceModel(
        sid: servicesIdController.toString(),
        name: nameController.toString(),
        phoneNumber: phoneNmbrController.toString(),
        email: emailController.toString(),
        address: addressController.toString(),
        serviceTypes: serviceTypes.toString(),
        hourlyRate: double.parse(hourlyChargedController),
        imageUrl: Uint8List.fromList(utf8.encode(dowloadUrl)),
        desc: descController.toString());

    /* -------------------------------------------------------- */
    /// for deconding and back to string from Uini8List
//   String convertedString = utf8.decode(bytes);
/* -------------------------------------------------------- */
    String sId = DateTime.now().millisecondsSinceEpoch.toString();
    await _firestore
        .collection('services')
        .doc(sId)
        .set(serviceModel.toJson())
        .then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Dashboard()),
          (Route<dynamic> route) => false);
      Fluttertoast.showToast(msg: "Save User Successfully");
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
