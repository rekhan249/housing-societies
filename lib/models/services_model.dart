// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ServiceModel {
  final String sid;
  final String name;
  final String phoneNumber;
  final String email;
  final String address;
  final String serviceTypes;
  final double hourlyRate;
  final String desc;
  // final List<Uint8List> imageUrl;

  ServiceModel({
    required this.sid,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.serviceTypes,
    required this.hourlyRate,
    required this.desc,
    // required this.imageUrl
  });

  Map<String, dynamic> toMap() {
    return {
      'sid': sid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'serviceTypes': serviceTypes,
      'hourlyRate': hourlyRate,
      'desc': desc,
      // 'imageUrl': imageUrl,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      sid: map['sid'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      serviceTypes: map['serviceTypes'] as String,
      hourlyRate: map['hourlyRate'] as double,
      desc: map['desc'] as String,
      // imageUrl: List<Uint8List>.from(map['imageUrl']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
