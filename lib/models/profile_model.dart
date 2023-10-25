class ProfileModel {
  final String pid;
  final String userName;
  final String email;
  final String phoneNum;
  final String cnic;
  final String age;
  final String gender;
  final String address;
  final String city;
  final String county;
  // final List<Uint8List> profilePic;

  ProfileModel({
    required this.pid,
    required this.userName,
    required this.email,
    required this.phoneNum,
    required this.cnic,
    required this.age,
    required this.gender,
    required this.address,
    required this.city,
    required this.county,
    // required this.profilePic
  });

  factory ProfileModel.fromMap(map) => ProfileModel(
        pid: map['pid'],
        userName: map['userName'],
        email: map['email'],
        phoneNum: map['phoneNum'],
        cnic: map['cnic'],
        age: map['age'],
        gender: map['gender'],
        address: map['address'],
        city: map['city'],
        county: map['county'],
        // profilePic: List<Uint8List>.from(map['profilePic'])
      );

  Map<String, dynamic> toMap() {
    return {
      'pid': pid,
      'userName': userName,
      'email': email,
      'phoneNum': phoneNum,
      'cnic': cnic,
      'age': age,
      'gender': gender,
      'address': address,
      'city': city,
      'county': county,
      // 'profilePic': profilePic
    };
  }
}
