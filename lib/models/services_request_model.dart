import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesRequest {
  final String uId;
  final String userEmail;
  final String serviceType;
  final bool isApproved;
  final bool isReserved;
  final DateTime isReservedAt;
  final DateTime timestamp;
  final String sId;

  ServicesRequest({
    required this.uId,
    required this.userEmail,
    required this.serviceType,
    required this.isApproved,
    required this.isReserved,
    required this.isReservedAt,
    required this.timestamp,
    required this.sId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userEmail': userEmail,
      'serviceType': serviceType,
      'isApproved': isApproved,
      'isReserved': isReserved,
      'isReservedAt': isReservedAt,
      'timestamp': timestamp,
      'serviceModel': sId,
    };
  }

  factory ServicesRequest.fromMap(Map<String, dynamic> map) {
    return ServicesRequest(
        uId: map['uId'] as String,
        userEmail: map['userEmail'] as String,
        serviceType: map['serviceType'] as String,
        isApproved: map['isApproved'] as bool,
        isReserved: map['isReserved'] as bool,
        isReservedAt: (map['isReservedAt'] as Timestamp).toDate(),
        timestamp: (map['timestamp'] as Timestamp).toDate(),
        sId: map['sId']);
  }

  String toJson() => json.encode(toMap());

  factory ServicesRequest.fromJson(String source) =>
      ServicesRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
