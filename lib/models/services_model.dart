import 'dart:typed_data';

class ServiceModel {
  final String sid;
  final String name;
  final String phoneNumber;
  final String email;
  final String address;
  final String serviceTypes;
  final double hourlyRate;
  final String desc;
  final Uint8List imageUrl;

  ServiceModel(
      {required this.sid,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.address,
      required this.serviceTypes,
      required this.hourlyRate,
      required this.desc,
      required this.imageUrl});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      sid: json['sid'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address'],
      serviceTypes: json['serviceTypes'],
      hourlyRate: json['hourlyRate'].toDouble(),
      desc: json['desc'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sid': sid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'serviceTypes': serviceTypes,
      'hourlyRate': hourlyRate,
      'desc': desc,
      'imageUrl': imageUrl
    };
  }
}
