class ServiceModel {
  final String sid;
  final String name;
  final String phoneNumber;
  final String email;
  final String address;
  final List<String> serviceTypes;
  final double rating;
  final int numberOfRatings;
  final double hourlyRate;
  final String imageUrl;

  ServiceModel(
      {required this.sid,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.address,
      required this.serviceTypes,
      required this.rating,
      required this.numberOfRatings,
      required this.hourlyRate,
      required this.imageUrl});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      sid: json['sid'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address'],
      serviceTypes: List<String>.from(json['serviceTypes']),
      rating: json['rating'].toDouble(),
      numberOfRatings: json['numberOfRatings'],
      hourlyRate: json['hourlyRate'].toDouble(),
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
      'rating': rating,
      'numberOfRatings': numberOfRatings,
      'hourlyRate': hourlyRate,
      'imageUrl': imageUrl
    };
  }
}
