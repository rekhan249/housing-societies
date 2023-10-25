// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Service {
  final String name;
  final String imageUrl;

  Service({required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);
}
